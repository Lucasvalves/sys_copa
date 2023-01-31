#from tkinter import *

import tkinter as tk

# creates and runs an instance of the window
window = tk.Tk()

#makes the size of the widow
window.geometry("600x400")

#sets a title for the screen
window.title("intercode")

# creating a new label and adding a text to the window
new_label=tk.Label(window,text='Enter your height in feet\n')
new_label.pack()

#creates a entrybox to add words to window
entry_label=tk.Entry(window)
entry_label.pack()

# defines results as string var
results= tk.StringVar(window)

#creating a results label
result_lable=tk.Label(window,textvariable=results)
result_lable.pack()


def callbackfunct():
    height = entry_label.get()
    try:
        height= float(height)
    except ValueError:
        results.set("\nPlease Enter Number.")
    converted_height=0.0606061*float(height)
    # rounds to decimal places
    converted_height=round(converted_height,3)

    results.set(f"\nYou are converted height |{converted_height}| tall.")

    print(f"inputs .*>|{converted_height}|<*. ")
# deletes the text in the text box
    entry_label.delete(0,tk.END)

# creating a button with a command
buttonez = tk.Button(text="Submit", command=callbackfunct)
buttonez.pack()


window.mainloop()



