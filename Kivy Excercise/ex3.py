# Please do not implement your exercises here, so other people can use it.
# Build your own Kivy environment as described on the main page, and implement it there.
#
#
############################################ EX3 #################################################
#
# This one is pretty complicated, and involves a lot of OOP (object oriented) decisions. I provide you with a .py
# file contains skeleton for my implementation suggestion. The guidelines here are related to this suggestion.
#
# Let's imagine an experiment that contains 2 different blocks:
# Block 1:
#   The subject should doodle on the screen.
#   Duration: X seconds, you choose.
#   The signal is continuous, contains the positional data from 2 hands (exactly as implemented in ex2.)
# Block 2:
#   The subject should periodically touch the screen for a short duration (almost a tapping).
#   Duration: Y seconds, you choose - but differ from block 1.
#   The signal is discrete, contains the duration of each touch - in the order they appeared.
#
# The order of the blocks is random: For one subject it will be block1 and then block2, for others the opposite.
#
# Implement a data acquisition application for that experiment.
# Here you will do it on your own, but I provide here some guidelines for *my implementation* suggestion (there are
# plenty of good implementation to do that).
#
########### Guidelines for my implementation:
#
# 1) Implement 2 widgets: Block1Widget, and Block2Widget. Each widget should handle the proper task of the block.
#    Each of them will receive the writer stream in the constructor, and will sample the data in 100Hz.
#    Think of how you want to save Block2's data within a continuous signal (maybe just stack the values in the end?).
#    In order to distinguish between the blocks in the data - Markers should be pushed into the stream. Those
#    SHOULD NOT be implemented in the widgets' constructors (which will initiate the marker immediately), but only when
#    the task actually begins. In addition, another timer should be implemented - to count the total time of the task
#    and stop it. This should be done from the application itself.
#    There are multiple ways to do that, I'll suggest 2:
#       1) For each widget, implement "start" and "stop" methods. The "start" will push a marker to the stream
#          and then will trigger the sampling timer. The "stop" will optionally push values to the stream and then
#          cancel the sampling timer, if such is exists.
#          That way, you will need to call "start" and "stop" from within the application, anytime you want to start
#          a task, for example:
#               widg = Block1Widget()                           // define the task
#               block1 = Clock.schedule(end, X)                 // call "end" after X sec
#               widg.start()                                    // start recording, including the marker
#           and in the "end" functions:
#               widg.stop()                                     // stop sampling
#               // remove widg
#
#           This is will be done within the Screen objects:
#           The Screens have events "on_enter" / "on_leave", which are be called automatically and can
#           initiate the widgets' "start" / "stop" methods.
#
# 2) As mentioned, my suggestion involves Screen objects as wrappers for the Widgets.
#    I found this way recommended for multiple-task experiment, especially with randomly chosen blocks.
#    Read more about Screen and ScreeManager here:
#    https://kivy.org/doc/stable/api-kivy.uix.screenmanager.html
#    The wrappers will start the tasks and initiate their timers.
#    They will also show a text (instructions) before starting the task. In the end, They
#    will be in charge to take the experiment to the next block in order.
#    Implement 1 Screen object: "BlockScreen". The object should inherit Kivy's "Screen" object.
#    The object's constructor should receive a widget object (either Block1 or Block2 widget), timer for the task,
#    text to show, the ScreenManager instance and the name of the next block in order.
#
#    Implement "end_block" method, that simply change the ScreenManager to the next block's Screen. ( sm.current = _ )
#    Override the "on_enter" event handler: It schedule "end_block" to the proper timeing, add the widget,
#    and then start the widget.
#    Override the "on_leave" event handler: It should remove the widget, and then stop the widget.
#    Note: If you want to use the text instructions, you may add Button object as a widget, that calls another
#    method when clicked (or right-clicked? or press "enter"? up to you). This way you will need to add another
#    function.
#    Note 2: If you do use the Button's "on_press" event (regular click on the button), it may cause unwanted behaviour
#    on the widget - try, and think why. Try to fix it - it's easy.
#
# 3) In the App object, you will need to define the logic behind the order of the experiment. Meanly, you will need to
#    define the timers for the Screens (Do not be confused with the sampling timers, which are within the widget!), The
#    order of the blocks, and simply return the ScreenManager with the first block Screen.
#    Each Screen MUST be defined with a name - a String object. something like: sm.add_widget(Screen(name="", ...))
#    Then you will need to define the first block: sm.current = _name_
#    And then simply return the sm from the 'build' function.
#    Question: How do you gonna stop the application? Try it out, and check the data file. Does the last marker appear?
#              If not - Try to fix this. A hint is in the skeleton.
#
# 4) The Screen-based application can be described with a scheme as follows:
#
#   * BlockWidget object (inherit Widget) *
#       constructor receives:
#           - writer stream object
#       methods:
#           - sampling (optionally)
#           - touch events handlers
#           - start
#           - stop
#
#   * Screen Object (inherit Screen) *
#       attributes:
#           - name
#           - BlockWidget instance [widg]
#           - timer
#           - text
#           - ScreenManager instance [sm]
#           - name of the next block
#       methods:
#           - on_enter:
#               * add widg (using self.add_widget)
#               * call widg.start()
#           - stop:
#               * take the app to the next block
#           - on_leave:
#               * call widg.stop()
#               * remove widg (using self.remove_widget)
#
#   * App object (inherit App) *
#       - attributes:
#           - ScreenManager [sm]  ( self.sm = ScreenManager() )
#           - DataFrame (a writer stream)
#       - methods:
#           - on_stop:
#               * usual routines of stopping an app
#           - change_block:
#               * schedule "stop" to after Y seconds
#               * change the current screen to the screen ( sm.current = <name> )
#           - build:
#               * draw a random order of the blocks, and define the Screens accordingly
#               * Add the Screens to the sm
#               * it's best doing in 1 line: ( sm.add_widget(MyScreen(name=, widget=, timer=, etc...)) )
#               * define the current screen to the proper screen (sm.current = _name_)
#               * return sm
#
#
# ! ! ! Good luck ! ! !
