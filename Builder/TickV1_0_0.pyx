import time
import threading

ticks = {}
locks = {}

def startticking(name, interval):
    ticks[name] = 0
    locks[name] = threading.Lock()
    threading.Thread(target=tick, args=(name, interval), daemon=True).start()

def tick(name, interval):
    while name in locks:
        time.sleep(interval)
        with locks[name]:
            ticks[name] += 1

def stopticking(name):
    locks.pop(name, None)

def gettick(name):
    return ticks.get(name, None)

def waitticks(name, count):
    while gettick(name) is None or gettick(name) < count:
        time.sleep(0.1)