#!/bin/bash

# An editor to create a custom command prompt.

# All variables used
easy_edit_form=""
display_form=""
full_form=""
number_of_items_in_easy_edit_form=0
main_seg_active=1
var_for_cutting=1
check_this_out="blank"
error_reason="Reason unknown."

# Functions
terminate_due_to_error () {
echo "The program has been terminated due to error:"; echo $error_reason; echo "Please report this issue."
exit 1
}

update_full_form () {
echo "Updating full form."
var_for_cutting=1
full_form=""
while [ "$var_for_cutting" -le "$number_of_items_in_easy_edit_form" ]
check_this_out=$(echo $easy_edit_form | cut -d '%' -f $var_for_cutting)
case "$check_this_out" in
# Items
	1a) 
	1b)
	1c)
	1d)
	1e)
	1f)
        1g)
        1h)
        1i)
        1j)
        1k)
        1l)  
        1m)
        1n)
        1o)
        1p)
        1q)
        1r)  
        1s)
# Colors
        2a)
        2b)
        2c)
        2d)
        2e)  
        2f)
        2g)
        2h)
        2i)
        2j)
        2k)  
        2l)
        2m)
        2n)
        2o)
        2p)
# Single chars
        ?)	easy_edit_form+=$check_this_out
		;;
# Something that should not be there
	*)	error_reason="An error was found in the sting used to store your custom command line prior to saving it."
		terminate_due_to_error
		;;
esac
}	

update_display_form () {
echo "Updating display form."

}

# Starts from here
echo "Running this editor will clear your shell, do you want to continue? (y/n)"
read start_confirm
if [ "$start_confirm" != "y" ] && [ "$start_confirm" != "Y" ]; then
echo "Quiting..."; exit
else

while [ "$main_seg_active" == 1 ]; do
update_full_form
update_display_form
clear
echo "
--- Command Prompt Editor ---
"
echo -e $display_form
#case "$input_selection" in
#        %)
#        q!)
#        rm)
#        wr)
#        ex)
#        hh)
#        
#}      


done # end of the main while loop
fi # end of the start confirmation if
