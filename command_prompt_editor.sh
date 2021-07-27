#!/bin/bash

# An editor to create a custom command prompt.


easy_edit_form=""
display_form=""
full_form=""
number_of_items_in_easy_edit_form=0
main_seg_active=1
var_for_cutting=1

update_full_form () {
echo "Updating full form."
var_for_cutting=1

echo $easy_edit_form | cut -d '`' -f 1

}

update_display_form () {
echo "Updating display form."

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
echo -e $display_form

done # end of the main while loop
fi # end of the start confirmation if
