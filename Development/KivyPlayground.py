from kivy.app import App
from kivy.uix.widget import Widget


class MyWidg(Widget):
    def on_touch_down(self, touch):
        print(touch.spos)

class MyApp(App):
    def build(self):
        return MyWidg()

if __name__ == "__main__":
    MyApp().run()