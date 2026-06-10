import pyautogui
import time
import sys

SCROLL_AMOUNT = -50
# After this many seconds, attempt to scroll back to the top
RESET_INTERVAL = 30 * 60  # 30 minutes
# When resetting, send a large positive scroll to try to reach the top
SCROLL_TO_TOP_AMOUNT = 10000

start_time = time.time()

try:
    while True:
        pyautogui.moveTo(500, 500, duration=0.5)
        pyautogui.moveTo(600, 500, duration=0.5)
        pyautogui.scroll(SCROLL_AMOUNT)

        elapsed = time.time() - start_time
        if elapsed >= RESET_INTERVAL:
            pyautogui.scroll(SCROLL_TO_TOP_AMOUNT)
            start_time = time.time()

        time.sleep(1)
except KeyboardInterrupt:
    print("Autoscroller stopped by user")
    sys.exit(0)
