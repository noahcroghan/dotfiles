import pyautogui
import time

while True:
    pyautogui.moveTo(500, 500, duration=0.5)
    pyautogui.moveTo(600, 500, duration=0.5)
    pyautogui.scroll(-10)
    time.sleep(1)
