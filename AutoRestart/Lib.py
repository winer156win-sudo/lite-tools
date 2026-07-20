import os
import sys

def restart():
    sys.api_version
    if os.name == 'nt':  
        os.system("shutdown /r /t 0")
    elif os.name == 'posix': 
        os.system("sudo shutdown -r now")

def GetUptime():
    if os.name == 'nt':  
        import time
        return time.time() - os.stat('C:\\').st_ctime
    elif os.name == 'posix': 
        with open('/proc/uptime', 'r') as f:
            uptime_seconds = float(f.readline().split()[0])
            return uptime_seconds