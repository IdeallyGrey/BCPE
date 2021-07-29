# PromptEditor





# To Undo Changes
(NOTE: You must be logged into the same user that you used the editor with.)
First, open a text editor of your choice to edit this file: ~/.bashrc_backup_made_by_command_prompt_editor

Next, at the bottom of the file you should see something that looks similar to this (depending on how many times you have run the editor, there may be multiple copies):

\# ---Added by the custom command prompt editor---

PS1='\[\033[0;31m\](\t | \u | \W)$\[\033[0m\] '

export PS1

\# ---End added by the custom command prompt editor---

Delete those four lines, (and if there are multipule copies, delete them too.)

Now, save and close your text editor.

Finally, run this command:

```rm -r ~/.bashrc; mv ~/.bashrc_backup_made_by_command_prompt_editor ~/.bashrc; source ~/.bashrc```

(ATTENTION: Run this command ONLY if you could access the above mentioned file, bad things may happen otherwise. Consider this a warning.)
