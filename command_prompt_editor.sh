#!/bin/bash

# An editor to create a custom command prompt.


easy_edit_form=""
display_form=""
full_form=""
main_seg_active=1

update_full_form () {
echo "Full form updated"
}

update_display_form () {
echo "Display form updated"
}

echo "Running this editor will clear your shell, do you want to continue? (y/n)"
read start_confirm
if [ "$start_confirm" != "y" ] && [ "$start_confirm" != "Y" ]; then
echo "Quiting..."; exit
else

while [ "$main_seg_active" == 1 ]; do
update_full_form
update_display_form
# clear
echo "
--- Command Prompt Editor ---
"


done # end of the main while loop
fi # end of the start confirmation if
