# Important:
This is not a stable project. Usage may result in having a messed up command prompt. This can be undone (see bellow). You have been warned.

# Overview
BCPE stands for Bash Command Prompt Editor. It's meant to be an easy way to spice up your command line, and potentally make it more useful. You can customise your design with 'items'. These include things like the username, machine hostname, current time, number of commands run, and more. You can also choose from 17 different colors. And of course, it's open-source.
# Examples
Whether you're an information junkie:

![Screenshot_20210729_161756](https://user-images.githubusercontent.com/77685111/127560783-5d55f344-e6e4-46fd-8013-717499d409d7.png)

Or a [r/unixporn](https://www.reddit.com/r/unixporn/) lover:

![Screenshot_20210729_162325](https://user-images.githubusercontent.com/77685111/127561168-b2596d91-9a23-480a-8661-ec0760b427df.png)

Or just a regular user looking to add some personalization:

![Screenshot_20210729_163422](https://user-images.githubusercontent.com/77685111/127562244-a3f17593-0272-4d13-bbd7-d82786066cb1.png)

We're sure you'll find this handy!

# Instructions
Setup:

Find and download the latest release (It should be bellow the "About" section on GitHub), and then extract the contents (If you downloaded the .tar.gz version, this can be done with the command "tar -xvf [filename]"). Enter the new directory, where you should see a file labled "bcpe". Start the editor by running "./bcpe". 

Once in the editor:

In the editor you may run commands, add characters to your design, or add items to your design. When adding characters (such as: |, #, \*, a, 7, etc..) to the design in the editor, you must enter one character at a time. When adding items, enter the two character code for the coresponding item. The same goes for commands. For a " " (space) enter 'sp'. 

# To Undo Changes
(NOTE: You must be logged into the same user that you used the editor with.)
First, open a text editor of your choice to edit this file: `~/.bashrc`

Next, at the bottom of the file you should see something that looks similar to this (depending on how many times you have run the editor, there may be multiple copies):

\# ---Added by the custom command prompt editor---

PS1='\[\033[0;31m\](\t | \u | \W)$\[\033[0m\] '

export PS1

\# ---End added by the custom command prompt editor---

Delete those four lines, (and if there are multipule copies, delete them too.)

Now, save and close your text editor.

Finally, close and re-open your terminal.
