import _tkinter
import tkinter as tk
from tkinter import messagebox
from Lib import restart, GetUptime

class MainGui:
    def __init__(self, master):
        self.master = master
        master.title("Auto Restart")
        self.label = tk.Label(master, text="Auto Restart")
        self.label.pack()
        self.restart_button = tk.Button(master, text="Restart", command=self.restart)
        self.restart_button.pack()
        self.uptime_label = tk.Label(master, text="UpTime: ")
        self.uptime_label.pack()
        self.quit_button = tk.Button(master, text="Quit", command=master.quit)
        self.quit_button.pack()
    def restart(self):
        uptime_seconds = GetUptime()
        uptime_hours = uptime_seconds / 3600
        if uptime_hours < 1:
            messagebox.showwarning("Warning", "The system has been up for less than 1 hour. Are you sure you want to restart?")
            if not messagebox.askyesno("Confirm Restart", "Are you sure you want to restart?"):
                return
        if messagebox.askyesno("Confirm", "Are you sure?"):
            restart()
if __name__ == "__main__":
    root = tk.Tk()
    my_gui = MainGui(root)
    root.mainloop()