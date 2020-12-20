# -*- coding: utf-8 -*-
"""
Created on Wed Oct 28 21:32:10 2020

@author: Sen
"""
import tkinter as tk
from tkinter import ttk
import time
import sys
import os
from pynput.keyboard import Key, Controller
from pynput.mouse import Button, Controller as MouseController
import threading
mouse = MouseController()
Keys = {"ALT": Key.alt, "LALT":Key.alt_l, "RALT":Key.alt_r, "CAPSLOCK":Key.caps_lock, "BS":Key.backspace, "BACKSPACE": Key.backspace,
        "CMD":Key.cmd, "LCMD":Key.cmd_l, "RCMD": Key.cmd_r, "DELETE":Key.delete,"DEL":Key.delete, "END":Key.end, "ENTER": Key.enter, "F1": Key.f1,
        "F2": Key.f2,"F3": Key.f3,"F4": Key.f4,"F5": Key.f5,"F6": Key.f6,"F7": Key.f7,"F8": Key.f8,"F9": Key.f9,"F10": Key.f10,"F11": Key.f11,"F12": Key.f12,
        "LEFT":Key.left, "RIGHT": Key.right, "UP": Key.up, "DOWN": Key.down, "SHIFT":Key.shift, "LSHIFT":Key.shift_l, "RSHIFT":Key.shift_r, "SPACE":Key.space}
keyboard = Controller()
root = tk.Tk()
root.title("AutoBotV1")
varForeverKey = tk.IntVar()
varForKey = tk.IntVar()
mbvar=tk.IntVar()
#ELEMENTS ---------------------------------------------------------------------
butt=False
keySequence = []
buttonSequence = []
def stop():
    python = sys.executable
    os.execl(python, python, * sys.argv)
def addKey():
    keyAdded = Keys[varx.get()]
    typeEntry = typeinfo.get()
    keySequence.append(typeEntry)
    keySequence.append(keyAdded)
def click():
    delaytime = int(delay.get())
    time.sleep(delaytime)
    interval = int(setInterval.get())
    if varForKey.get() == 1 and varForeverKey.get() == 0:
        reps = int(setReps.get())
        for repetition in range(reps):
            time.sleep(interval)
            keyboard.type(keySequence[0])              
            keyboard.press(keySequence[1])
            if repetition == (reps-1):
                stop()
    elif varForeverKey.get() == 1 and varForKey.get() == 0:
        while True:
            time.sleep(interval)
            if butt==True:
                break
            for key in keySequence:
                if isinstance(key, str):
                    keyboard.type(key)
                else:
                    keyboard.press(key)
thread = threading.Thread(target=click)
thread.daemon=True
tabs = ttk.Notebook(root)
tabs.grid()
autotyper= tk.Frame(tabs, width=300, height=200, bg="white")
autoclicker= tk.Frame(tabs, width=300, height=200, bg="white")
autotyper.grid(row=0, column=0)
autoclicker.grid(row=0,column=1)
tabs.add(autotyper, text="AutoTyper")
tabs.add(autoclicker, text="AutoClicker")
autostart =tk.Button(autotyper, text="START AUTOTYPER", fg="black", font = "arial 12 bold", command=thread.start) 
setdelaylabel = tk.Label(autotyper, text="Set Delay Until Start:", fg="black", font = "arial 10")
tk.Label(autotyper, text="Enter Text Here:", fg="black", font = "arial 10") .grid(row=0, column=0)
typeinfo = tk.Entry(autotyper, width=20, bg="white", font = "arial 10")
delay = tk.Entry(autotyper, width=20, bg="white", font = "arial 10")
keypresscats = list(Keys.keys())
varx=tk.StringVar(autotyper)
varx.set(keypresscats[5])
keyButton = tk.Button(autotyper, text="Add Keypress", command=addKey, font = "arial 10")
keyPresses = tk.OptionMenu(autotyper, varx, *keypresscats)
setInterval = tk.Entry(autotyper, width=20, bg="white", font = "arial 10")
setIntervalLabel = tk.Label(autotyper, text="Enter Interval Here:", font = "arial 10")
setReps = tk.Entry(autotyper, width=20, bg="white", font="arial 10")
setRepLabel = tk.Label(autotyper, text="Enter Repetitions Here:", font = "arial 10") .grid(row=6, column=0)
runForever = tk.Checkbutton(autotyper, text="Run Forever", variable=varForeverKey, font = "arial 10") .grid(row=5, column=2)
runFor = tk.Checkbutton(autotyper, text="Run For:", variable=varForKey, font = "arial 10") .grid(row=6, column=2)
stopbutt = tk.Button(autotyper, text="Stop AutoTyper", command=stop, font = "arial 10").grid(row=7, column=2)
fillerL = tk.Label(autotyper, text="          ", bg="white", font = "arial 10").grid(row=0, column=1)

#ELEMENTS ---------------------------------------------------------------------
def ShowButt():
    sel=mbvar.get()
    print(sel)
    mbdic={0:Button.left, 1:Button.right, 2:"scroll"}
    buttonSequence.append(mbdic[sel])
def ClearButt():
    buttonSequence=[]
def StartButt():
    repsform = int(repsm.get())
    intervalsmouse = int(interm.get())
    for repe in repsform:
        time.sleep(intervalsmouse)
        for button in buttonSequence:
            if button == "scroll":
                mouse.scroll=(0,1)
            else:
                mouse.press(button)
                mouse.release(button)
#ELEMENTS AUTOCLICKER ---------------------------------------------------------
tk.Label(autoclicker, text="   Select Mouse Buttons:  ") .grid(row=0, column=0)
tk.Radiobutton(autoclicker, text="Left Click", variable=mbvar, value=0, bg="white").grid(row=1, column=0, sticky=tk.W)
tk.Radiobutton(autoclicker, text="Right Click", variable=mbvar, value=1, bg="white").grid(row=2, column=0, sticky=tk.W)
tk.Radiobutton(autoclicker, text="Middle Button", variable=mbvar, value=2, bg="white").grid(row=3, column=0, sticky=tk.W)
tk.Button(autoclicker, text="Append Seq.", command=ShowButt,) .grid(row=4, column=0,sticky=tk.W)
tk.Button(autoclicker, text="Clear Seq.", command=ClearButt) .grid(row=4, column=0, sticky=tk.E)
tk.Label(autoclicker, text="", bg="white") .grid(row=5, column=0)
tk.Label(autoclicker, text="Repetitions:") .grid(row=6, column=0, sticky=tk.W)
repsm = tk.Entry(autoclicker, width=11, bg="grey", fg="white")
repsm.grid(row=7, column=0, sticky=tk.W)
tk.Label(autoclicker, text="Start ", fg="white", bg="white") .grid(row=0, column=2)
tk.Button(autoclicker, text="START AUTOCLICKER", command=StartButt, font="arial 12 bold" ) .grid(row=0, column=3)
tk.Label(autoclicker, text="   Intervals:   ") .grid(row=6, column=0, sticky=tk.E)
interm = tk.Entry(autoclicker, width=10, bg="grey", fg="white")
interm.grid(row=7, column=0, sticky=tk.E) 
#ELEMENTS AUTOCLICKER ---------------------------------------------------------

#GRIDDING AUTOCLICKER----------------------------------------------------------

#GRIDDING AUTOCLICKER----------------------------------------------------------

#GRIDDING----------------------------------------------------------------------
autostart.grid(row=0, column=2)
setdelaylabel.grid(row=2, column=0)
typeinfo.grid(row=1, column=0)
delay.grid(row=3, column=0)             
keyButton.grid(row=1, column=2)
setIntervalLabel.grid(row=4, column=0)
setInterval.grid(row=5, column=0)
keyPresses.grid(row=2, column=2)
setReps.grid(row=7, column=0)
#GRIDDING----------------------------------------------------------------------


root.geometry('366x240')
root.iconbitmap(r"C:\Users\muddu_bbz1k23\Downloads\autoboticon_EPr_icon.ico")
windowpic = tk.PhotoImage(file=r"C:\Users\muddu_bbz1k23\Pictures\autoboticon(2).PNG")
root.configure(bg="white")
root.mainloop()