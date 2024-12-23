import json
from kivy.app import App
from kivy.uix.boxlayout import BoxLayout
from kivy.uix.label import Label
from kivy.uix.textinput import TextInput
from kivy.uix.button import Button
from kivy.uix.popup import Popup
from kivy.uix.scrollview import ScrollView
from kivy.graphics import Color, Rectangle
from kivy.core.window import Window
import os

# Get the directory where the script is located
script_dir = os.path.dirname(os.path.abspath(__file__))
protocols_conf = os.path.join(script_dir, "protocols_conf.json")

# Patch Dictionary
# change here to the actual name wanted to be saved, and the actual port is being used
patches = {
    "Patch1": {"count": 0, "port": 5001, "name": "Patch1", "instructions": "Do this for Patch1."},
    "Patch2": {"count": 0, "port": 5002, "name": "Patch2", "instructions": "Do this for Patch2."},
}
possible_blocks = list(patches.keys())

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

        popup_layout.add_widget(label)
        popup_layout.add_widget(load_button)
        popup_layout.add_widget(new_button)
        popup.content = popup_layout
        popup.open()

    def load_protocol(self):
        self.clear_widgets()

        # Main Layout
        layout = BoxLayout(orientation='vertical', padding=10, spacing=10)

        # Title
        title = Label(
            text="Choose a Protocol",
            font_size=20,
            size_hint_y=None,
            height=50,
            color=(1, 1, 1, 1)  # White text color
        )
        layout.add_widget(title)

        # Scrollable layout for buttons
        protocols_layout = BoxLayout(orientation='vertical', spacing=10, size_hint_y=None)
        protocols_layout.bind(minimum_height=protocols_layout.setter('height'))

        # Background color for the protocols layout
        with protocols_layout.canvas.before:
            Color(0.1, 0.1, 0.1, 1)  # Dark background color
            Rectangle(size=protocols_layout.size, pos=protocols_layout.pos)

        # Add buttons for each protocol
        for name in self.protocols.keys():
            button = Button(
                text=name,
                size_hint_y=None,
                height=40,  # Adjust height for smaller buttons
                color=(1, 1, 1, 1)  # White text color
            )
            button.bind(on_press=lambda x: self.start_experiment(name))
            protocols_layout.add_widget(button)

        layout.add_widget(protocols_layout)
        self.add_widget(layout)

    def start_experiment(self, name):
        app = App.get_running_app()
        app.protocol_blocks = [(block['name'], block['timer']) for block in self.protocols[name]]
        app.sm.current = "register_names"

    def new_protocol(self):
        self.clear_widgets()
        self.current_blocks = []

        # Layout
        layout = BoxLayout(orientation='vertical', padding=10, spacing=10)
        patches_label = Label(text=f"Possible Patches: {possible_blocks}")
        input_layout = BoxLayout(size_hint_y=None, height=50)
        block_input = TextInput(hint_text="Block Name", multiline=False)
        timer_input = TextInput(hint_text="Timer (sec)", input_filter="int", multiline=False, size_hint_x=0.3)
        add_button = Button(text="Add Block", on_press=lambda x: self.add_block(block_input, timer_input))
        layout.add_widget(patches_label)
        input_layout.add_widget(block_input)
        input_layout.add_widget(timer_input)
        input_layout.add_widget(add_button)
        layout.add_widget(input_layout)

        # Blocks List
        self.blocks_list = ScrollView(size_hint=(1, None), size=(Window.width, Window.height * 0.5))
        self.blocks_list_content = BoxLayout(orientation="vertical", size_hint_y=None)
        self.blocks_list_content.bind(minimum_height=self.blocks_list_content.setter("height"))
        self.blocks_list.add_widget(self.blocks_list_content)
        layout.add_widget(self.blocks_list)

        # Buttons
        buttons_layout = BoxLayout(size_hint_y=None, height=50, spacing=10)
        save_button = Button(text="Save Protocol", on_press=lambda x: self.save_protocol())
        start_button = Button(text="Start Experiment", on_press=lambda x: self.start_experiment("Unknown Protocol"))
        buttons_layout.add_widget(save_button)
        buttons_layout.add_widget(start_button)
        layout.add_widget(buttons_layout)

        self.add_widget(layout)

    def add_block(self, block_input, timer_input):
        block_name = block_input.text.strip()
        timer = timer_input.text.strip()
        if not block_name or not timer:
            self.show_popup("Error", "Block Name and Timer are required!")
            return
        if block_name not in possible_blocks:
            self.show_popup("Error", "Block name must match a patch name!")
            return
        self.current_blocks.append({"name": block_name, "timer": timer})
        self.update_blocks_list()
        block_input.text = ""
        timer_input.text = ""

    def update_blocks_list(self):
        self.blocks_list_content.clear_widgets()
        for block in self.current_blocks:
            label = Label(text=f"{block['name']} - {block['timer']} sec", size_hint_y=None, height=30)
            self.blocks_list_content.add_widget(label)

    def save_protocol(self):
        if not self.current_blocks:
            self.show_popup("Error", "No blocks to save!")
            return

        def save_protocol_name(instance):
            protocol_name = protocol_input.text.strip()
            if not protocol_name:
                self.show_popup("Error", "Protocol Name is required!")
                return
            self.protocols[protocol_name] = self.current_blocks
            save_protocols(self.protocols)

            app = App.get_running_app()
            app.current_protocol = self.current_blocks  # Store the current protocol blocks
            print(f"Saved Protocol: {protocol_name}")
            print(f"Protocol Details: {app.current_protocol}")

            save_popup.dismiss()
            self.start_experiment(protocol_name)

        # Popup for Protocol Name
        save_layout = BoxLayout(orientation="vertical", spacing=10, padding=10)
        save_layout.add_widget(Label(text="Enter Protocol Name:"))
        protocol_input = TextInput(hint_text="Protocol Name", multiline=False)
        save_layout.add_widget(protocol_input)
        save_button = Button(text="Save", on_press=save_protocol_name)
        save_layout.add_widget(save_button)
        save_popup = Popup(title="Save Protocol", content=save_layout, size_hint=(0.7, 0.5), auto_dismiss=False)
        save_popup.open()

    def show_popup(self, title, message):
        popup_layout = BoxLayout(orientation='vertical', spacing=10, padding=10)
        label = Label(text=message)
        close_button = Button(text="OK", size_hint_y=None, height=40, on_press=lambda x: popup.dismiss())
        popup_layout.add_widget(label)
        popup_layout.add_widget(close_button)
        popup = Popup(title=title, content=popup_layout, size_hint=(0.7, 0.5))
        popup.open()

