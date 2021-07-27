#!/bin/bash

# An editor to create a custom command prompt.


easy_edit_form=""
expanded_form=""

echo "Running this editor will clear your shell, do you want to continue? (y/n)"
read start_confirm
if [ "$start_confirm" != "y" ] && [ "$start_confirm" != "Y" ]; then
echo "Quiting..."; exit
else

clear
echo "
--- Command Prompt Editor ---"
echo "The current command prompt is:"
echo -e "$PS1"

fi
