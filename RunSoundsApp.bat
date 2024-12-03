@echo off
call venv\Scripts\activate
set PYTHONPATH=%cd%
python Tapper\SoundsApp.py
deactivate