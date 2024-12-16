from kivy.app import App
from kivy.uix.widget import Widget
from Tapper.App_Utilities.ChooseProtocolWidget import ProtocolWidget

class MyWidg(Widget):
    def on_touch_down(self, touch):
        print(self.protocol)

class MyApp(App):
    protocol = None
    def build(self):
        print(self.protocol)
        return ProtocolWidget()

if __name__ == "__main__":
    MyApp().run()