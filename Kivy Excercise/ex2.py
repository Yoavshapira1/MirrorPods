# Please do not implement your exercises here, so other people can use it.
# Build your own Kivy environment as described on the main page, and implement it there.
#
#
############################################ EX2 #################################################
#
# Implement a simple data acquisition application, that saves a continuous signal of X seconds long.
# Here we will do it step by step, without a skeleton.
# However, most of the necessary imports are implemented - you may add some as you wish.
# There are some guidance questions along the way. My answers (not for all of them) appear after the imports section.
# Read them! But only after you are trying to implement the app.
#
#
# Step 1:
# Create an MyApp object (inherit 'App'), and build the Writer object for the DataFrame, as well as the Timer object.
# The writer can be any type you want. Recommended is pandas.DataFrame for short signal, or csv.writer
# for longer signal (less stable but allows big data)
# Each row in the dataframe contains 7 values:
# [x1, y1, id1, x2, y2, id2, ts]
# Don't forget to return a component from the 'build' method.
# Points to think about:
#   - Which component to return?
#   - What are the app's attributes, if any?
#
# Step 2:
# Create a MyWidget object (inherit 'Widget'), that can trace 2 touch events - has 2 pointers as attributes.
# The widget constructor should receive a Writer object as an argument, and save it as an attribute.
# Points to think about:
#   - Why is better to receive a Writer rather than create one? Think of your experiment flow & data and
#     Change the MyApp section if needed.
#
# Step 3:
# Implement a 'sampling' method in MyWidget, that writes a new row into the Writer, based on the 2 touch events.
# Schedule it to be evoked 100 times per second.
# Points to think about:
#   - Where is the timer should be created in order to trigger the sampling?
#   - What touch's values do you want to record? absolute? relative? Use the Kivy's Motion Event API.
#   - How do you handle Null-pointers, where there is no touch event occurs?
#
# Step 4:
# Override the event-handler called "on_stop". This event is a method of MyApp, and it will be evoked
# when the application is just about to close.
# Points to think about:
#   - What should be done when the application exits? From the perspective of: Data, I/O, App, etc.
#   - In what order? THIS IS VERY IMPORTANT. Think of the sampling operation, that occurs every 0.01 seconds,
#     and of its resources.
#
# Step 5:
# Override the MyWidget's event-handlers "on_touch_<down/move/up>". As a start - handle all 3 events to actually
# do something (don't just return or pass)
#
# Step 6:
# Try out your app. When debugging the behaviour, note that:
#   - Don't get your touches very close to each other - It can cause a disconnection-effect sometimes (more- on ex3)
#   - Count your actual touches, and check whether the signal reflects them all. What can cause a touch to disappear?
#   - Try to put first finger, then second, and then add third one. Then, remove the second touch. Does the signal
#     reflects this behaviour? How do you want to handle those situation? Do not change your code yet.
#
# Step 7:
# Remove the implementation of the "on_touch_move" event, and think how the app will be changed. Then repeat step 6.
# Points to think about:
#   - For what kind of signal the "on_touch_down" event is best for? Can you ignore this kind of event?
#
# Step 8:
# Do the same as 7 but for "on_touch_up".
# Points to think about:
#   - Can you ignore this kind of event? Why?
#
# Step 9: Try to achieve the original behaviour without the event "on_touch_down".
#
#
#
# ! ! ! Good luck ! ! !

from kivy.app import App
from kivy.uix.widget import Widget
from kivy.clock import Clock
import pandas as pd
import csv

# Answers:
# All the answers here are only my opinion of course, as I experienced things... There are a lot of good answers.
#
# Step 1:
#   - Which component to return?
#       The first component of your application. For a single-task application, that is recording a continuous signal,
#       a proper choice would be the widget object of that task.
#       For a multi-task experiment, the widget object of the first one would be a proper choice, as well as a "menu"
#       screen - or a "selector" screen - that will navigate the user to the task. This one may use "Screens" objects.
#
#
# Step 2:
#   - Why is better to receive a Writer rather than create one?
#       First notice that a single widget object usually manages the role of a single task.
#       So, in a single-task experiment, is not very important.
#       But in a multi-task experiment, that may contain discrete data along with continuous data, or just a continuous
#       data from different tasks - The writer stream should be shared for all tasks, and since the event-handlers
#       are implemented differently for different tasks, it is best that the widgets will not create the stream.
#
# Step 3:
#   - Where is the timer should be created in order to trigger the sampling?
#       This is a very tricky issue, and very much depends on the experiment and up tp you.
#       Naturally, since the sampling method is within the widget, it will be only natural
#       to create the timers (and trigger the sampling) from within the widget constructor.
#       BUT! Think of an experiment when you want to include an instruction before the recording, something
#       like "press Enter when you are ready". It might be easier implement from the app itself. App to you :)
#
# Step 4:
#   - What should be done when the application exits?
#       The most important things, are to cancel all the scheduled events we created (using the Clock) and to close
#       the Writer stream (and optionally, add some additional data to the file such as: Total time, number of touch
#       events, etc...)
#   - In what order?
#       ALWAYS make sure to first thing cancel the scheduled events. WHY: If you have an event that sampling every
#       0.01 seconds, and you close the file stream before you cancel this event - It may cause a situation where
#       the writer trying to write to the file, but the file is already closed. This will end with a RunTime error
#       that is very hard to trace.
#
#       Generally speaking: The Clock's event you define should be always under your control.
#                           Do not leave a (not-expired) scheduled event without cancel it!
#
# Step 7:
#   - For what kind of signal the "on_touch_down" event is best for? Can you ignore this kind of event?
#       Since this is a discrete event (happens only once for every touch event), is best for not-continuous signals.
#       For a continuous signal, you may consider ignore this.
#
# Step 8:
#   - Can you ignore this kind of event? Why?
#       Usually (for all of my implementations however...) - Absolutely not. In the data, we want to reflect the
#       situation of a disconnection, and the best way is with this event.
