#!/usr/bin/python
"""BatBar: A simple battery bar that shows the battery percentage and charging status."""
# BatBar ⚡ v1.1
# Version compatible with Windows 10/11, Linux and MacOS.
# - made by simonquasar
# pylint: disable=invalid-name, unused-argument, no-else-return
#import sys
import platform         # OS detection
import threading        # Threading
import time             # Sleep
import tkinter as tk    # GUI
import psutil           # Cross-platform system info (Requires: pip install psutil)

class BatBar:
    """Main class that manages the graphical interface and battery status."""
    def __init__(self):
        self.root = tk.Tk()
        self.screen_width = self.root.winfo_screenwidth()
        self.screen_height = self.root.winfo_screenheight()
        self.current_width = 1
        self.os_type = platform.system().lower()

        self.setup_main_window()

        self.battery_bar = tk.Frame(
            self.root,
            width=self.current_width,
            height=self.screen_height,
            bg="green"
        )
        self.battery_bar.place(x=0, y=0)

        self.setup_mouse_bindings()

        threading.Thread(target=self.update_battery_status, daemon=True).start()

    def setup_main_window(self):
        """Set up the main window properties."""
        self.root.overrideredirect(True)
        self.root.geometry(
            f"{self.current_width}x{self.screen_height}+"
            f"{self.screen_width-self.current_width}+0"
        )
        self.root.configure(bg="black")

        if self.os_type == "darwin":  # macOS
            self.root.wm_attributes("-transparent", True)
            self.root.wm_attributes("-topmost", True)
        elif self.os_type == "linux":
            self.root.wm_attributes("-type", "dock")
            self.root.wm_attributes("-topmost", True)
        else:  # Windows
            self.root.wm_attributes("-topmost", True)
            self.root.wm_attributes("-transparentcolor", "black")

        self.root.title("BatBar")

    def setup_mouse_bindings(self):
        """Set up mouse bindings for the battery bar."""
        if self.os_type == "darwin":
            self.battery_bar.bind("<MouseWheel>", self.on_mouse_wheel)
            self.battery_bar.bind("<Button-2>", self.on_mouse_click)  # Right click macOS
            self.root.bind("<MouseWheel>", self.on_mouse_wheel)
            self.root.bind("<Button-2>", self.on_mouse_click)
        elif self.os_type == "linux":
            self.battery_bar.bind("<Button-4>", lambda e: self.on_mouse_wheel_linux(e, 1))
            self.battery_bar.bind("<Button-5>", lambda e: self.on_mouse_wheel_linux(e, -1))
            self.battery_bar.bind("<Button-3>", self.on_mouse_click)
            self.root.bind("<Button-4>", lambda e: self.on_mouse_wheel_linux(e, 1))
            self.root.bind("<Button-5>", lambda e: self.on_mouse_wheel_linux(e, -1))
            self.root.bind("<Button-3>", self.on_mouse_click)
        else:
            self.battery_bar.bind("<MouseWheel>", self.on_mouse_wheel)
            self.battery_bar.bind("<Button-3>", self.on_mouse_click)  # Right click Windows
            self.root.bind("<MouseWheel>", self.on_mouse_wheel)
            self.root.bind("<Button-3>", self.on_mouse_click)

    def on_mouse_wheel_linux(self, event, delta):
        """Handle mouse wheel events for Linux."""
        self.update_bar_width(self.current_width + delta)

    def update_battery_status(self):
        """Update the battery status and GUI."""
        while True:
            battery = psutil.sensors_battery()
            if battery:
                percentage = int(battery.percent)
                is_charging = battery.power_plugged

                new_height = round(self.screen_height * percentage / 100)
                color = self.get_battery_color(percentage, is_charging)
                title = self.get_battery_title(percentage, is_charging)

                self.root.after(0, lambda: self.update_gui(new_height, color, title))
            time.sleep(5)

    def get_battery_color(self, percentage, is_charging):
        """Return the color based on battery percentage and charging status."""
        if is_charging:
            return "deepskyblue"
        if percentage <= 20:
            return "red"
        if percentage <= 35:
            return "orange"
        if percentage <= 50:
            return "yellow"
        if percentage <= 65:
            return "greenyellow"
        return "green"

    def get_battery_title(self, percentage, is_charging):
        """Return the title based on battery percentage and charging status."""
        return f"BatBar ⚡ {percentage}%" if is_charging else f"BatBar | {percentage}%"

    def update_gui(self, new_height, color, title):
        """Update the GUI with new battery status."""
        self.battery_bar.config(height=new_height, bg=color)
        self.battery_bar.place(x=0, y=(self.screen_height - new_height) // 2)
        self.root.title(title)

    def update_bar_width(self, new_width):
        """Update the width of the bar."""
        self.current_width = max(1, min(10, new_width))
        self.root.geometry(
            f"{self.current_width}x{self.screen_height}+"
            f"{self.screen_width-self.current_width}+0"
        )
        self.battery_bar.config(width=self.current_width)

    def on_mouse_wheel(self, event):
        """Handle mouse wheel events."""
        if self.os_type == "darwin":
            delta = -1 if event.delta > 0 else 1
        else:
            delta = 1 if event.delta > 0 else -1
        self.update_bar_width(self.current_width + delta)

    def on_mouse_click(self, event):
        """Handle mouse click events."""
        if (self.os_type == "darwin" and event.num == 2) or \
           (self.os_type != "darwin" and event.num == 3):
            if event.state & 0x0001:
                self.root.destroy()

    def run(self):
        """Run the main loop."""
        self.root.mainloop()

if __name__ == "__main__":
    app = BatBar()
    app.run()
