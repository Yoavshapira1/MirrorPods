import re
import os
from re import sub
from kivy.clock import Clock
from kivy.core.window import Window
from kivy.properties import StringProperty
from kivy.uix.label import Label
from kivy.uix.popup import Popup
from kivy.uix.button import Button
from kivy.uix.spinner import Spinner
from kivy.uix.slider import Slider
from kivy.uix.textinput import TextInput
from kivy.garden.matplotlib import FigureCanvasKivy
from matplotlib import pyplot as plt
from kivymd.app import MDApp
from kivymd.uix.boxlayout import BoxLayout
from kivymd.uix.button import MDIconButton
from kivy.uix.filechooser import FileChooserIconView
from Tapper.App_Utilities.utils import ALL_DYADIC_DIR


def init_ax(ax, title):
    ax.set_aspect(1)
    ax.set_xlim(0, 1)
    ax.set_ylim(0, 9 / 16)
    ax.set_yticks([])
    ax.set_xticks([])
    if title not in [1, 2]:
        ax.set_title(title)
    else:
        ax.set_title("Screen%d" % title)


class DataPlot(BoxLayout):
    srate = 125.0
    interval = 1 / srate
    speed = StringProperty("[color=000000]Speed: x%.2f[/color]" % (1 / srate / interval))
    i = 0
    # skip ratio is a tuple T that define how many frames to skip (T[0]), after how many passed frames (T[1])
    no_skip_ratio = (1, 1)
    fast_values_need_to_skip = [-1, 0, 1]
    skip_ratios_for_fat_values = [(3, 1), (6, 1), (14, 1)]
    skip_ratios_for_high_speeds = dict(zip(fast_values_need_to_skip, skip_ratios_for_fat_values))
    sample = StringProperty("[color=000000]Sample: %d[/color]" % i)

    def __init__(self, data1, data2, ax_num=2, titles=(1, 2), **kwargs):
        super(DataPlot, self).__init__(**kwargs)
        self.orientation = 'vertical'
        self.data1 = data1
        self.data2 = data2
        self.ax_num = ax_num
        self.titles = titles
        self.length = self.data1.shape[0]
        self.is_playing = False
        self.is_backward = False
        self.current_skipping_ratio = self.skip_ratios_for_high_speeds[0]
        self.create_controllers()
        self.create_figure()

    def create_figure(self):
        self.fig, self.axs = plt.subplots(1, self.ax_num, constrained_layout=True)
        if self.ax_num == 1: self.axs = [self.axs]
        for ax, t in zip(self.axs, self.titles):
            init_ax(ax, t)
        self.scatter1 = [None]
        self.scatter2 = [None]
        animation_canvas = FigureCanvasKivy(self.fig)
        self.add_widget(animation_canvas)

    def create_controllers(self):
        self.box = BoxLayout(orientation='horizontal', height=50, size_hint=(1, None))

        # Create the Sample slider
        self.samples_slider = Slider(min=0, max=len(self.data1) - 1, value=0, size_hint_x=8)
        self.samples_slider.bind(value=self.update_plot)

        # Create the Speed slider
        self.speed_slider = Slider(min=-6, max=1, step=1, value=0, width=100)
        self.speed_slider.bind(value=self.update_interval)

        # Create labels for the sliders
        self.samples_slider_label = Label(text=self.sample, markup=True)
        self.speed_slider_label = Label(text=self.speed, markup=True)

        # Create the "play backwards" button
        self.play_backwards_button = MDIconButton(icon='skip-previous')
        self.play_backwards_button.bind(on_press=self.play_backwards)

        # Create the "pause" button
        self.pause_button = MDIconButton(icon='pause')
        self.pause_button.bind(on_press=self.pause_traverse)

        # Create the "play" button
        self.play_button = MDIconButton(icon='play')
        self.play_button.bind(on_press=self.play_traverse)

        # Create the "exit" button
        self.exit_button = MDIconButton(icon='stop')
        self.exit_button.bind(on_press=self.stop)

        # Create the Sample input box
        self.sample_input = TextInput(hint_text='Enter here\nSpecific sample', multiline=False, input_type='number')
        self.sample_input.bind(on_text_validate=self.choose_sample)

        # Create the "+" button
        self.plus_button = MDIconButton(icon='plus')
        self.plus_button.bind(on_press=self.step_forward)

        # Create the "-" button
        self.minus_button = MDIconButton(icon='minus')
        self.minus_button.bind(on_press=self.step_backward)

        # Arrange the widgets in the desired order
        self.box.add_widget(self.samples_slider_label)
        self.box.add_widget(self.samples_slider)
        self.box.add_widget(self.minus_button)
        self.box.add_widget(self.sample_input)
        self.box.add_widget(self.plus_button)
        self.box.add_widget(self.play_backwards_button)
        self.box.add_widget(self.pause_button)
        self.box.add_widget(self.play_button)
        self.box.add_widget(self.exit_button)
        self.box.add_widget(self.speed_slider_label)
        self.box.add_widget(self.speed_slider)
        self.add_widget(self.box)

    def stop(self, instance):
        app = MDApp.get_running_app()
        root_widget = app.root
        root_widget.remove_widget(self)
        choose_session_widget = ChooseSession(enter_dyad=False)
        choose_session_widget.bind(size=lambda _, size: setattr(choose_session_widget, 'size_hint', (None, None)))
        root_widget.add_widget(choose_session_widget)

    def choose_sample(self, instance):
        try:
            if not self.is_playing:
                sample_number = int(instance.text)
                if sample_number >= self.length:
                    self.samples_slider.value = self.length-1
                    self.update_plot(self.samples_slider, self.length-1)
                elif sample_number < 0:
                    self.samples_slider.value = 0
                    self.update_plot(self.samples_slider, 0)
                else:
                    self.samples_slider.value = sample_number
                    self.update_plot(self.samples_slider, sample_number)
        except Exception:
            pass
        finally:
            instance.text = ""

    def step_forward(self, instance):
        if self.i < len(self.data1) - 1:
            self.i += 1
            self.samples_slider.value = self.i
            self.update_plot(self.samples_slider, self.i)

    def step_backward(self, instance):
        if self.i > 0:
            self.i -= 1
            self.samples_slider.value = self.i
            self.update_plot(self.samples_slider, self.i)

    def update_interval(self, instance, value):
        if value in self.fast_values_need_to_skip:
            self.current_skipping_ratio = self.skip_ratios_for_high_speeds[value]
        else:
            self.current_skipping_ratio = self.no_skip_ratio
        speed_change = 1 / ((2 ** value) * self.srate)
        self.speed = "[color=000000]Speed: x%.2f[/color]" % (1 / self.srate / speed_change)
        self.speed_slider_label.text = self.speed

    def update_ax(self, data, ax, scat):
        if scat[0]:             # if scat contains some values, so clean this scatter and create new one
            scat[0].remove()
        x, y = [data[self.i][0], data[self.i][3]], [data[self.i][1], data[self.i][4]]
        scat[0] = ax.scatter(x, y, color=[(169 / 255, 160 / 255, 146 / 255), (232 / 255, 112 / 255, 118 / 255)], s=80,
                             alpha=0.5, edgecolor='black')  # Plot ch_1

        # scat[0] = ax.scatter(x, y, c=[1,2], cmap='cool', s=80, alpha=0.8, edgecolor='black')  # Plot ch_1

    def update_plot(self, instance, value):
        self.i = int(value)
        self.sample = "[color=000000]Sample: %d[/color]" % self.i
        self.samples_slider_label.text = self.sample
        if self.ax_num == 1:
            ax1, ax2 = [self.axs[0]] * 2
        else:
            ax1, ax2 = self.axs
        self.update_ax(self.data1, ax1, self.scatter1)
        self.update_ax(self.data2, ax2, self.scatter2)
        self.fig.canvas.draw()

    def play_traverse(self, instance):
        if not self.is_playing:
            self.is_playing = True
            self.play_button.disabled = True
            self.pause_button.disabled = False
            self.play_backwards_button.disabled = True
            self.is_backward = False
            self.traverse_array(instance)

    def play_backwards(self, instance):
        if not self.is_playing:
            self.is_playing = True
            self.play_button.disabled = True
            self.pause_button.disabled = False
            self.play_backwards_button.disabled = True
            self.is_backward = True
            self.traverse_array(instance)

    def pause_traverse(self, instance):
        self.is_playing = False
        self.play_button.disabled = False
        self.pause_button.disabled = True
        self.play_backwards_button.disabled = False

    def traverse_array(self, instance):
        if self.is_playing:
            if self.i % self.current_skipping_ratio[1] == 0:
                step = self.current_skipping_ratio[0]
            else:
                step = 1
            step = -step if self.is_backward else step

            # animation forward ended
            if self.i + step > len(self.data1):
                self.is_playing = False
                self.play_button.disabled = True
                self.pause_button.disabled = True
                self.play_backwards_button.disabled = False
                self.i = len(self.data1)-1

            # animation backwards ended
            elif self.i + step <= 0:
                self.is_playing = False
                self.play_button.disabled = False
                self.pause_button.disabled = True
                self.play_backwards_button.disabled = True
                self.i = 0

            # animation ongoing
            else:
                self.i += step
                self.samples_slider.value = self.i
                self.update_plot(instance, self.i)
                Clock.schedule_once(self.traverse_array, self.interval)


class ChooseSession(BoxLayout):
    choose_session_text = "Choose Session From The List Below"

    def __init__(self, enter_dyad=True, **kwargs):
        super().__init__(**kwargs)
        self.app = MDApp.get_running_app()
        self.choose_file() if enter_dyad else self.choose_session()

    def choose_file(self):
        self.choose_file_popup = Popup(title="Select a Dyadic file or a directory, and then press 'Enter'. NOTICE that "\
                                       "while .xlsx are preferred for post-processed data, they take more time to load")

        self.file_chooser = FileChooserIconView(path=ALL_DYADIC_DIR, dirselect=True)
        self.file_chooser.filters = [lambda dir, file: file.endswith('.xlsx') or file.endswith('.xdf')]
        self.choose_file_popup.add_widget(self.file_chooser)

        self.choose_file_popup.open()

        self._keyboard = Window.request_keyboard(self._keyboard_closed, self)
        self._keyboard.bind(on_key_down=self._on_keyboard_down)

    def _keyboard_closed(self):
        self._keyboard.unbind(on_key_down=self._on_keyboard_down)

    def _on_keyboard_down(self, keyboard, keycode, text, modifiers):
        input = keycode[1]
        if input == "enter":
            self.check()
            return

    def check(self):
        file_path = self.file_chooser.selection[0]
        choose = self.file_chooser.selection[0].split('\\')[-1].split('.')[0]
        if not (re.compile('d\d{3}_s\d{3}_\w{2}_s\d{3}_\w{2}').match(choose) or (os.path.isdir(file_path) and re.compile('d\d{3}').match(choose))):
            popup = Popup(title='Error!\nChoose another file', size_hint=(0.8, 0.25))
            popup.open()

        else:
            self._keyboard_closed()
            self.choose_file_popup.dismiss()
            from_xdf, from_excel = False, False
            if not os.path.isdir(file_path):
                if file_path.endswith('.xdf'):
                    from_xdf = True
                else:
                    from_excel = True

            from Dyad import Dyad
            if self.app.df is None:
                self.app.df = Dyad(file_path, smooth=self.app.smooth, from_xdf=from_xdf, from_excel=from_excel, analyze=False)

            self.choose_session()

    def choose_session(self):
        self.choose_session_popup = Popup(title="Choose session", size_hint=(0.8, 0.6), auto_dismiss=False)
        content = BoxLayout(orientation='vertical', spacing=10, padding=10)
        sessions = ["Session {}: {}".format(i+1, s[1]['session']) for i, s in enumerate(self.app.df.sessions.items())]
        self.session_order_dict = dict(zip(sessions, self.app.df.sessions.keys()))
        self.content_dropdown = Spinner(text=self.choose_session_text, values=sessions, size_hint=(1, 0.05),
                                        background_color=[1, 1, 1, 1], color=[0, 0, 0, 1])
        content_button_start = Button(text='Start', size_hint=(1, 0.2), font_size=36)
        content_button_start.bind(on_release=self.animate)
        content.add_widget(self.content_dropdown)
        content.add_widget(content_button_start)
        self.choose_session_popup.content = content
        self.choose_session_popup.open()

    def find_dyad_fir_path(self, dyad):
        for f in os.listdir(ALL_DYADIC_DIR):
            if os.path.isdir(ALL_DYADIC_DIR + r"\%s" % f):
                if int(sub('\D', '', f)) == int(dyad):
                    return ALL_DYADIC_DIR + r"\%s" % f
        return None

    def animate(self, instance):
        session = self.content_dropdown.text
        if session == self.choose_session_text:
            return
        order = self.session_order_dict[session]
        start, stop = self.app.df.sessions[order]['start'], self.app.df.sessions[order]['stop']
        data1, data2 = self.app.df.screen1_data[start:stop], self.app.df.screen2_data[start:stop]
        self.choose_session_popup.dismiss()
        root_widget = self.app.root
        root_widget.remove_widget(self)
        root_widget.add_widget(DataPlot(data1, data2, size_hint=(1., 1.)))


class DataPlotApp(MDApp):
    def __init__(self, data1, data2, ax_num, titles=(1, 2), **kwargs):
        if len(titles) != ax_num:
            print(len(titles))
            print(titles)
            print(ax_num)
            raise ValueError("amount of titles must fit the ax_num")

        self.data1, self.data2 = data1, data2
        self.titles = titles
        self.ax_num = ax_num
        super().__init__(**kwargs)

    def build(self):
        Window.maximize()
        return DataPlot(self.data1, self.data2, self.ax_num, self.titles)


class AnimateDyad(MDApp):
    def __init__(self, smooth=True, df=None, **kwargs):
        self.smooth=smooth
        self.df = df
        super().__init__(**kwargs)

    def build(self):
        Window.maximize()
        root_widget = BoxLayout(orientation='vertical')
        choose_session_widget = ChooseSession()
        choose_session_widget.bind(size=lambda _, size: setattr(choose_session_widget, 'size_hint', (None, None)))
        root_widget.add_widget(choose_session_widget)
        return root_widget


if __name__ == '__main__':
    AnimateDyad(smooth=False).run()
