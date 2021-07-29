# Overview

# Instructions
Setup:

Find and download the latest release (It should be bellow the "About" section on GitHub), and then extract the contents (If you downloaded the .tar.gz version, this can be done with the command "tar -xvf [filename]"). Enter the new directory, where you should see a file labled "bcpe.sh". Start the editor by running "./bcpe.sh". 

In the editor:

In the editor you may run commands, add characters to your design, or add items to your design. When adding characters (|, #, \*, a, 7, etc..) to the design in the editor, you must enter one character at a time. When adding items, enter the two character code for the coresponding item. The same goes for commands. For a " " (space) enter 'sp'. 

# To Undo Changes
(NOTE: You must be logged into the same user that you used the editor with.)
First, open a text editor of your choice to edit this file: ~/.bashrc

Next, at the bottom of the file you should see something that looks similar to this (depending on how many times you have run the editor, there may be multiple copies):

\# ---Added by the custom command prompt editor---

PS1='\[\033[0;31m\](\t | \u | \W)$\[\033[0m\] '

export PS1

\# ---End added by the custom command prompt editor---

Delete those four lines, (and if there are multipule copies, delete them too.)

Now, save and close your text editor.

Finally, close and re-open your terminal.
