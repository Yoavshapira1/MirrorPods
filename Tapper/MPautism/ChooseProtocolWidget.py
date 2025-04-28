import json
from kivy.app import App
from kivy.uix.boxlayout import BoxLayout
from kivy.uix.stacklayout import StackLayout
from kivy.uix.floatlayout import FloatLayout
from kivy.uix.label import Label
from kivy.uix.textinput import TextInput
from kivy.uix.button import Button
from kivy.uix.popup import Popup
from kivy.uix.scrollview import ScrollView
import os

# this script dir
script_dir = os.path.dirname(os.path.abspath(__file__))
protocols_conf = os.path.join(script_dir, "protocols_conf.json")

# main project dir
main_project_dir = os.path.split(os.path.dirname(script_dir))[0]

# Max patches dir
max_patch_dir = os.path.join(main_project_dir, "Max")

def find_matching_subdirs(max_dir):
    patches = []
    for name in os.listdir(max_dir):
        subdir_path = os.path.join(max_dir, name)
        if os.path.isdir(subdir_path):
            expected_file = os.path.join(subdir_path, name + '.maxpat')
            if os.path.isfile(expected_file):
                patches.append(name)
    return patches


# patches dictionary structure:
# {
#     count: int
#     name: String
#     instructions: String
#     radius_size: float
#     delay_to_start: float
# }
patches = {}
possible_blocks = find_matching_subdirs(max_patch_dir)
for patch in possible_blocks:
    patches[patch] = {"count": 0, "name": patch, "instructions": patch, "radius_size": 0.16, "delay_to_start": 2}
    if patch == "Scale Player":
        patches[patch]["radius_size"] = 0.
    if patch == "Granular":
        patches[patch]["delay_to_start"] = 4

# Load protocol configuration file or create an empty one
def load_protocols():
    try:
        with open(protocols_conf, "r") as file:
            return json.load(file)
    except FileNotFoundError:
        with open(protocols_conf, "w") as file:
            json.dump({}, file)
        return {}


def save_protocols(protocols):
    with open(protocols_conf, "w") as file:
        json.dump(protocols, file, indent=4)


class ProtocolWidget(BoxLayout):
    def __init__(self, **kwargs):
        super().__init__(orientation='vertical', **kwargs)
        self.protocols = load_protocols()
        self.current_blocks = []
        self.show_start_popup()

    def show_start_popup(self):
        popup_layout = BoxLayout(orientation='vertical', padding=10, spacing=10)
        label = Label(text="Choose an option:")
        popup = Popup(title="Start Experiment", size_hint=(0.7, 0.5), auto_dismiss=False)

        load_button = Button(text="Load Protocol", on_press=lambda x: [popup.dismiss(), self.load_protocol()])
        new_button = Button(text="New Protocol", on_press=lambda x: [popup.dismiss(), self.new_protocol()])
        edit_button = Button(text="Edit Protocol", on_press=lambda x: [popup.dismiss(), self.choose_protocol_to_edit()])

        popup_layout.add_widget(label)
        popup_layout.add_widget(load_button)
        popup_layout.add_widget(new_button)
        popup_layout.add_widget(edit_button)
        popup.content = popup_layout
        popup.open()

    def load_protocol(self):
        self.clear_widgets()

        # Main Layout
        popup_layout = StackLayout(orientation='tb-lr', padding=10, spacing=10)
        popup = Popup(title="Choose a Protocol", size_hint=(0.7, 0.5), auto_dismiss=False)

        # Title
        title = Label(
            text="Choose a Protocol",
            font_size=20,
            size_hint_y=None,
            height=50,
            color=(1, 1, 1, 1)  # White text color
        )
        popup_layout.add_widget(title)

        # Scrollable layout for buttons
        protocols_layout = BoxLayout(orientation='vertical', spacing=10, size_hint_y=None)
        protocols_layout.bind(minimum_height=protocols_layout.setter('height'))

        # Add buttons for each protocol
        for name in self.protocols.keys():
            button = Button(
                text=name,
                size_hint_y=None,
                height=40,  # Adjust height for smaller buttons
                color=(1, 1, 1, 1)  # White text color
            )
            button.bind(on_press=lambda x, protocol_name=name: [popup.dismiss(), self.start_experiment(protocol_name)])
            protocols_layout.add_widget(button)

        popup_layout.add_widget(protocols_layout)
        popup.content = popup_layout
        popup.open()

    def start_experiment(self, name):
        self.clear_widgets()

        app = App.get_running_app()
        app.protocol_blocks = [(block['name'], block['timer']) for block in self.protocols[name]]
        app.sm.current = "register_names"

    def start_experiment_without_saving(self):
        self.clear_widgets()

        app = App.get_running_app()
        app.protocol_blocks = [(block['name'], block['timer']) for block in self.current_blocks]
        app.sm.current = "register_names"

    def new_protocol(self):
        self.clear_widgets()
        self.current_blocks = []

        # Layout
        popup_layout = BoxLayout(orientation='horizontal', padding=10, spacing=10)
        popup = Popup(title="Create a New Protocol", size_hint=(0.7, 0.5), auto_dismiss=False)

        # Box will contains all possible patches
        patches_layout = StackLayout(orientation='tb-lr', spacing=5)
        patches_layout.add_widget(Label(text="Patches list:", font_size=18, size_hint_y=0.2))

        # Add buttons to the box, for every protocol
        for name in patches:
            button = Button(
                text=name,
                size_hint_y=None,
                height=40,  # Adjust height for smaller buttons
                color=(1, 1, 1, 1)  # White text color
            )
            button.bind(on_press=lambda x, patch_name=name: [timer_input(patch_name)])
            patches_layout.add_widget(button)

        popup_layout.add_widget(patches_layout)

        def timer_input(patch_name):
            input_timer_popup = Popup(title=f"Enter Timer for: {patch_name}", size_hint=(0.3, 0.12), auto_dismiss=False)
            input_layout = BoxLayout(size_hint_y=None, height=40)
            timer_input = TextInput(hint_text="Leave blank for unlimited", input_filter="int", multiline=False)
            ok_button = Button(text="OK", on_press=lambda x: [self.add_block(input_timer_popup, patch_name, timer_input)])
            timer_input.bind(on_text_validate=lambda x: [self.add_block(input_timer_popup, patch_name, timer_input)])
            # add widgets for input (timer input & OK button)
            input_layout.add_widget(timer_input)
            input_layout.add_widget(ok_button)
            # add the input layout to the popup
            input_timer_popup.content = input_layout
            input_timer_popup.open()

        # Blocks List
        block_list_container = BoxLayout(orientation='vertical', spacing=5)
        block_list_container.add_widget(Label(text="Blocks Order:", font_size=18, size_hint_y=0.2))
        self.blocks_list = ScrollView(size_hint=(1, 1))
        self.blocks_list_content = BoxLayout(orientation="vertical", size_hint_y=None)
        self.blocks_list_content.bind(minimum_height=self.blocks_list_content.setter("height"))
        self.blocks_list.add_widget(self.blocks_list_content)
        block_list_container.add_widget(self.blocks_list)
        popup_layout.add_widget(block_list_container)

        # Save and start without saving buttons
        buttons_container = FloatLayout()
        save_button = Button(
            text="Save And Start",
            size_hint=(None, None),
            size=(180, 60),
            pos_hint={"center_x": 0.5, "center_y": 0.7},
            on_press=lambda x: [popup.dismiss(), self.save_protocol()]
        )
        no_nave_button = Button(
            text="Start Without Saving",
            size_hint=(None, None),
            size=(180, 60),
            pos_hint={"center_x": 0.5, "center_y": 0.3},
            on_press=lambda x: [popup.dismiss(), self.start_experiment_without_saving()]
        )
        buttons_container.add_widget(save_button)
        buttons_container.add_widget(no_nave_button)

        popup_layout.add_widget(buttons_container)
        popup.content = popup_layout
        popup.open()

    def choose_protocol_to_edit(self):
        self.clear_widgets()
        popup_layout = StackLayout(orientation='tb-lr', padding=10, spacing=10)
        popup = Popup(title="Edit a Protocol", size_hint=(0.7, 0.5), auto_dismiss=False)

        title = Label(
            text="Choose a Protocol to Edit",
            font_size=20,
            size_hint_y=None,
            height=50,
            color=(1, 1, 1, 1)
        )
        popup_layout.add_widget(title)

        protocols_layout = BoxLayout(orientation='vertical', spacing=10, size_hint_y=None)
        protocols_layout.bind(minimum_height=protocols_layout.setter('height'))

        for name in self.protocols.keys():
            button = Button(
                text=name,
                size_hint_y=None,
                height=40,
                color=(1, 1, 1, 1)
            )
            button.bind(on_press=lambda x, protocol_name=name: [popup.dismiss(), self.load_for_edit(protocol_name)])
            protocols_layout.add_widget(button)

        popup_layout.add_widget(protocols_layout)
        popup.content = popup_layout
        popup.open()

    def load_for_edit(self, protocol_name):
        self.current_blocks = self.protocols[protocol_name].copy()  # Load existing blocks
        self.editing_protocol_name = protocol_name  # Save which protocol is being edited
        self.edit_protocol(self.editing_protocol_name)

    def edit_protocol(self, protocol_name):
        self.clear_widgets()
        self.current_blocks = self.protocols[protocol_name].copy()
        self.editing_protocol_name = protocol_name

        layout = BoxLayout(orientation='vertical', padding=10, spacing=10)
        layout.add_widget(Label(text=f"Editing Protocol: {protocol_name}", font_size=20, size_hint_y=None, height=40))

        self.timer_inputs = []

        for i, block in enumerate(self.current_blocks):
            block_layout = BoxLayout(orientation='horizontal', size_hint_y=None, height=40, spacing=10,
                                     size_hint_x=None, width=400)
            block_layout.pos_hint = {"center_x": 0.5}

            block_label = Label(
                text=block['name'],
                size_hint_x=None,
                width=200,
                halign='left',
                valign='middle'
            )
            block_label.bind(size=block_label.setter('text_size'))  # ensures proper text alignment

            timer_input = TextInput(
                text="" if block['timer'] == 987654321 else str(block['timer']),
                hint_text="unlimited",
                input_filter="int",
                multiline=False,
                size_hint_x=None,
                width=100
            )

            self.timer_inputs.append((i, timer_input))

            block_layout.add_widget(block_label)
            block_layout.add_widget(timer_input)
            layout.add_widget(block_layout)

        save_button = Button(
            text="Save Changes",
            size_hint=(None, None),
            size=(180, 50),
            pos_hint={"center_x": 0.5},
            on_press=self.save_edited_protocol
        )
        layout.add_widget(save_button)

        self.add_widget(layout)

    def add_block(self, timer_popup, block_name, timer_input):
        if not timer_input.text:
            timer = 987654321
        else:
            timer = timer_input.text.strip()
        self.current_blocks.append({"name": block_name, "timer": timer})
        self.update_blocks_list()
        timer_input.text = ""
        timer_popup.dismiss()

    def update_blocks_list(self):
        self.blocks_list_content.clear_widgets()
        for block in self.current_blocks:
            time_label = "unlimited" if block['timer'] == 987654321 else f"{block['timer']} sec"
            label = Label(text=f"{block['name']} - {time_label}", size_hint_y=None, height=30)
            self.blocks_list_content.add_widget(label)

    def save_protocol(self, *kwargs):
        if not self.current_blocks:
            self.show_popup("Error", "No blocks to save!")
            return

        def save_protocol_name(instance=None):
            protocol_name = protocol_input.text.strip()
            if not protocol_name:
                self.show_popup("Error", "Protocol Name is required!")
                return

            self.protocols[protocol_name] = self.current_blocks
            save_protocols(self.protocols)

            app = App.get_running_app()
            app.current_protocol = self.current_blocks

            save_popup.dismiss()
            self.start_experiment(protocol_name)

        # New protocol save
        save_layout = BoxLayout(orientation="vertical", spacing=10, padding=10)
        save_layout.add_widget(Label(text="Enter Protocol Name:"))
        protocol_input = TextInput(hint_text="Protocol Name", multiline=False, on_text_validate=save_protocol_name)
        save_layout.add_widget(protocol_input)
        save_button = Button(text="Save", on_press=save_protocol_name)
        save_layout.add_widget(save_button)
        save_popup = Popup(title="Save Protocol", content=save_layout, size_hint=(0.7, 0.5), auto_dismiss=False)
        save_popup.open()


    def save_edited_protocol(self, instance):
        for index, timer_input in self.timer_inputs:
            text = timer_input.text.strip()
            timer_value = 987654321 if not text else int(text)
            self.current_blocks[index]['timer'] = timer_value

        protocol_name = self.editing_protocol_name
        self.protocols[protocol_name] = self.current_blocks
        save_protocols(self.protocols)

        self.show_popup("Saved", f"Protocol '{protocol_name}' updated successfully!")

        app = App.get_running_app()
        app.current_protocol = self.current_blocks
        self.start_experiment(protocol_name)

    def show_popup(self, title, message):
        popup_layout = BoxLayout(orientation='vertical', spacing=10, padding=10)
        label = Label(text=message)
        close_button = Button(text="OK", size_hint_y=None, height=40, on_press=lambda x: popup.dismiss())
        popup_layout.add_widget(label)
        popup_layout.add_widget(close_button)
        popup = Popup(title=title, content=popup_layout, size_hint=(0.7, 0.5))
        popup.open()


class ChoosePatchWidget(BoxLayout):
    def __init__(self, **kwargs):
        super().__init__(orientation='vertical', **kwargs)

        patches_layout = (BoxLayout(orientation='vertical', spacing=5))
        patches_layout.add_widget(Label(text="Patches list:", font_size=18, size_hint_y=0.2))

        # Add buttons to the box, for every protocol
        for name in patches:
            button = Button(
                text=name,
                size_hint_y=None,
                size_hint_x=None,
                height=40,  # Adjust height for smaller buttons
                width=200,
                pos_hint={"center_x": 0.5},
                color=(1, 1, 1, 1)  # White text color
            )
            button.bind(on_press=lambda x, patch_name=name: [timer_input(patch_name)])
            patches_layout.add_widget(button)

        self.add_widget(patches_layout)

        def timer_input(patch_name):
            input_timer_popup = Popup(title=f"Enter Timer for: {patch_name}.", size_hint=(0.42, 0.12), auto_dismiss=False)
            input_layout = BoxLayout(size_hint_y=None, height=40)
            timer_input = TextInput(hint_text="For unlimited session, leave blank", input_filter="int", multiline=False)
            timer_input.bind(on_text_validate=lambda x, popup=input_timer_popup: self.update_current_block(popup, patch_name, timer_input))
            ok_button = Button(text="OK", on_press=lambda x, popup=input_timer_popup: self.update_current_block(popup, patch_name, timer_input))
            # add widgets for input (timer input & OK button)
            input_layout.add_widget(timer_input)
            input_layout.add_widget(ok_button)
            # add the input layout to the popup
            input_timer_popup.content = input_layout
            input_timer_popup.open()

    def update_current_block(self, popup, patch_name, timer_input):
        if not timer_input.text:
            timer = 987654321
        else:
            timer = timer_input.text.strip()

        app = App.get_running_app()
        app.protocol_blocks.append((patch_name, timer))

        popup.dismiss()
        app.sm.current = 'instruction'