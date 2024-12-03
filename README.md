this is a test for dev branch

Copyright (c) 2023 

Code written by Yoav Shapira for Ayelet N. Landau, PhD
Department of Psychology, The Hebrew University of Jerusalem, Israel

All Rights Reserved

# Intro:
This project provides facilities for Dyadic Synchronization Motoric experiments conducted by Prof. Ayelet Landau, Hebrew University of Jerusalem.

The project is built mostly in Python, using Kivy: Framework for event-based programming handles touch events. More about Kivy in their docs:
https://kivy.org/doc/stable/

In this page you will find out how to start a general project using Kivy, and some other useful stuff for this project.

# Requirements:
**Windows** The project has not experimented on Mac or Linux 

**Python** version between 3.7 to 3.9

# Setting up:
IMPORTANT: Installed python version should be 3.7-3.9
1) Clone this project to a new directory.
2) In the directory, write `cmd` on the path line and press enter.
3) Write the next commands, each one followed by Enter:
   1) `python -m pip install --upgrade pip setuptools virtualenv`
   2) `python -m virtualenv venv`
   3) `venv\scripts\activate`
   4) `pip install -r requirements.txt`

Your kivy environment is ready to go!

# Running Apps From Terminal:
Let `dir` here, be the full path to the location of the project. Type the commands below, each followed by `Enter`:
1) `dir\venv\Scripts\activate`
2) `set PYTHONPATH=dir`
3) `python *app.py*`, where **app.py** is the full path to the python script file.

You can create your own batch file to run several lines together.  

# Packing a Kivy application:
NOTICE: This packing guise is **very** inefficient. A small app could be ~1GB size. It is not recommended. Pack the application only if you can't run the code due to system limitations.
1) open CMD in the target directory.
2) activate the Kivy venv.
3) Type `pip install --upgrade pyinstaller`.
4) Type `python -m PyInstaller --onefile --noupx --name <name> <file.py>`.
5) Make sure that a file named _name.spec_ created in the target directory.
6) Add `from kivy_deps import sdl2, glew, angle` to the top of the _.spec_ file.
7) Change the lines of EXE in the _.spec_ file, as described here in section 1: https://kivy.org/doc/stable/guide/packaging-windows.html#single-file-application
8) Type `python -m PyInstaller <name>.spec`. If asked `(y/n)?`, type `y` and Enter.
9) The executable app should appear now under the directory _dist/name_.

# Kivy CheatSheet:
**Configuration**
1. In order to change configuration, you need to use 

`Config.set()`
and then `Config.write()`.
2. Unlimit the number of frames as follows:

`Config.set('postproc', 'maxfps', '0')`

`Config.set('graphics', 'maxfps', '0')`.

# Zytronic Touch Firmware
Our device called **_ZXY500 256_**; 
1. Data Sheet: https://www.zytronic.co.uk/wp-content/uploads/2018/05/Data-Sheets-ZXY500-.pdf
2. User Manual: https://www.zytronic.co.uk/wp-content/uploads/2018/07/Zytronic_150200300500_UserManual-v3.pdf

# Links That You May Find Useful:
***Packing a Kivy application:***
https://kivy.org/doc/stable/guide/packaging-windows.html#packaging-a-simple-app

***LSL in GitHub:***
https://github.com/sccn/labstreaminglayer
