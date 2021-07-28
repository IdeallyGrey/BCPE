#!/bin/bash

# An editor to create a custom command prompt.

# All variables used
easy_edit_form=""
color="White"
display_form=""
full_form=""
size_of_easy_edit_form=0
extra_message=""
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
case "color" in
	White)	full_form+="\[\033[1;37m\]"
		;;
	Black)	full_form+="\[\033[0;30m\]"
		;;
	Red)  	full_form+="\[\033[0;31m\]"
                ;;
	Green)  full_form+="\[\033[0;32m\]"
                ;;
	Brown)  full_form+="\[\033[0;33m\]"
                ;;
	Blue)  	full_form+="\[\033[0;34m\]"
                ;;
	Purple) full_form+="\[\033[0;35m\]"
                ;;
	Cyan)  	full_form+="\[\033[0;36m\]"
                ;;
	LightGrey)  full_form+="\[\033[0;37m\]"
               		 ;;
	DarkGrey)  	full_form+="\[\033[1;30m\]"
               		 ;;
	LightRed)  	full_form+="\[\033[1;31m\]"
               		 ;;
	LightGreen) full_form+="\[\033[1;32m\]"
               		 ;;
	Yellow)  full_form+="\[\033[1;33m\]"
               	 ;;
	LightBlue)  full_form+="\[\033[1;34m\]"
               		 ;;
	LightPurple)  full_form+="\[\033[1;35m\]"
               		 ;;
	LightCyan)  full_form+="\[\033[1;36m\]"
                ;;
	*)	error_reason="An error has occured with the color variable. (Full form.)"
                terminate_due_to_error
                ;;
esac
while [ "$var_for_cutting" -le "$number_of_items_in_easy_edit_form" ]; do
check_this_out=$(echo $easy_edit_form | cut -d '%' -f $var_for_cutting)
case "$check_this_out" in
# Items
	1a)	full_form+="\[\a\]"
		;;
	1b)	full_form+="\d"
		;;
	1c)	full_form+="\h"
		;;
	1d)	full_form+="\H"
		;;
	1e)	full_form+="\j"
		;;
	1f)	full_form+="\l"
		;;
	1g)	full_form+="\s"
		;;
	1h)	full_form+="\t"
		;;
	1i)	full_form+="\T"
		;;
	1j)	full_form+="\@"
		;;
	1k)	full_form+="\A"
		;;
	1l)	full_form+="\u"
		;;
	1m)	full_form+="\v"
		;;
	1n)	full_form+="\V"
		;;
	1o)	full_form+="\w"
		;;
	1p)	full_form+="\W"
		;;
	1q)	full_form+="\!"
		;;
	1r)	full_form+="\#"
		;;
	1s)	full_form+="\$"
		;;
# Single chars
	?)	full_form+=$check_this_out
		;;
# Something that should not be there
	*)	error_reason="An error was found in the sting used to store your custom command line prior to saving it."
		terminate_due_to_error
		;;
esac
var_for_cutting=$(($var_for_cutting+1))
done
full_form+="\[\033[0m\] "
}	


update_display_form () {
echo "Updating display form."
var_for_cutting=1
display_form=""
extra_message=""
case "color" in
        White)  display_form+="\[\033[1;37m\]"
                ;;
        Black)  display_form+="\[\033[0;30m\]"
                ;;
        Red)    display_form+="\[\033[0;31m\]"
                ;;
        Green)  display_form+="\[\033[0;32m\]"
                ;;
        Brown)  display_form+="\[\033[0;33m\]"
                ;;
        Blue)   display_form+="\[\033[0;34m\]"
                ;;
        Purple) display_form+="\[\033[0;35m\]"
                ;;
        Cyan)   display_form+="\[\033[0;36m\]"
                ;;
        LightGrey)  display_form+="\[\033[0;37m\]"
                         ;;
        DarkGrey)       display_form+="\[\033[1;30m\]"
                         ;;
        LightRed)       display_form+="\[\033[1;31m\]"
                         ;;
        LightGreen) display_form+="\[\033[1;32m\]"
                         ;;
        Yellow)  display_form+="\[\033[1;33m\]"
                 ;;
        LightBlue)  display_form+="\[\033[1;34m\]"
                         ;;
        LightPurple)  display_form+="\[\033[1;35m\]"
                         ;;
        LightCyan)  display_form+="\[\033[1;36m\]"
                ;;
        *)      error_reason="An error has occured with the color variable. (Display form.)"
                terminate_due_to_error
                ;;
esac
while [ "$var_for_cutting" -le "$number_of_items_in_easy_edit_form" ]; do
check_this_out=$(echo $easy_edit_form | cut -d '%' -f $var_for_cutting)
case "$check_this_out" in
# Items
        1a)     display_form+="(Non-visable beep char.)"
		extra_message+="Should play beep. May be supressed on most systems."
                ;;
        1b)     display_form+="Mon January 1"
                ;;
        1c)     display_form+="$HOSTNAME"
                ;;
        1d)     display_form+="$HOSTNAME"
                ;;
        1e)     display_form+="(Number of active jobs)"
                ;;
        1f)     display_form+="(Terminal device name)"
                ;;
        1g)     display_form+="(Shell program name)"
                ;;
        1h)     display_form+="21:58:26"
                ;;
        1i)     display_form+="9:58:26"
                ;;
        1j)     display_form+="9:58:26 PM"
                ;;
        1k)     display_form+="21:58"
                ;;
        1l)    	display_form+="$USER"
                ;;
        1m)     display_form+="1.23"
                ;;
        1n)     display_form+="1.23.4"
                ;;
        1o)     display_form+="~/Documents/Directory/Example"
                ;;
        1p)     display_form+="/Example"
                ;;
        1q)     display_form+="(History # of this command)"
                ;;
        1r)     display_form+="(# of commands run during shell session)"
                ;;
        1s)     display_form+="(Displays '$' if normal user, or '#' if root user)"
                ;;
# Single chars
        ?)      display_form+=$check_this_out
                ;;
esac
var_for_cutting=$(($var_for_cutting+1))
done
display_form+="\[\033[0m\] sudo apt-get update"
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
add_seperator=true
clear
echo "
--- Command Prompt Editor ---
"
echo ""
echo "---"
echo -e $display_form
echo "---"
echo $extra_message
echo ""
echo "'q!' to force quit. 'wr' to write/enable custom prompt."
echo "'rm' to remove last char/item. 'ex' to export as .txt to share your design."
echo ""
read -p "Enter a single character, or a two character command/item > "
case "$input_selection" in
        %) 	echo "I'm sorry, you cannot use a '%' sign. Any other character is allowed!"
		add_seperator=false
		;;
# Commands
        q!)	echo "Program has been manually terminated."; exit
		;;
        rm)	
		;;
        wr)	main_seg_active=0
		add_seperator=false
		;;
        ex)	echo "Sorry! Exporting not yet supported."
		add_seperator=false
		;;
# Items
        1a)	easy_edit_form+=$input_selection
		;;
        1b)     easy_edit_form+=$input_selection
                ;;
        1c)     easy_edit_form+=$input_selection
                ;;
        1d)     easy_edit_form+=$input_selection
                ;;
        1e)     easy_edit_form+=$input_selection
                ;;
        1f)     easy_edit_form+=$input_selection
                ;;
        1g)     easy_edit_form+=$input_selection
                ;;
        1h)     easy_edit_form+=$input_selection
                ;;
        1i)     easy_edit_form+=$input_selection
                ;;
        1j)     easy_edit_form+=$input_selection
                ;;
        1k)     easy_edit_form+=$input_selection
                ;;
        1l)     easy_edit_form+=$input_selection
                ;;
        1m)     easy_edit_form+=$input_selection
                ;;
        1n)     easy_edit_form+=$input_selection
                ;;
        1o)     easy_edit_form+=$input_selection
                ;;
        1p)     easy_edit_form+=$input_selection
                ;;
	1q)     easy_edit_form+=$input_selection
                ;;
	1r)     easy_edit_form+=$input_selection
                ;;
	1s)     easy_edit_form+=$input_selection
                ;;

#  Colors
        2a)	color="Black"
		add_seperator=false
		;;
        2b)	color="Red"
                add_seperator=false
		;;
        2c)	color="Green"
                add_seperator=false
		;;
        2d)	color="Brown"
                add_seperator=false
		;;
        2e)	color="Blue"
                add_seperator=false
		;;
        2f)	color="Purple"
                add_seperator=false
		;;
        2g)	color="Cyan"
                add_seperator=false
		;;
        2h)	color="LightGrey"
                add_seperator=false
		;;
        2i)	color="DarkGrey"
                add_seperator=false
		;;
        2j)	color="LightRed"
                add_seperator=false
		;;
        2k)	color="LightGreen"
                add_seperator=false
		;;
        2l)	color="Yellow"
                add_seperator=false
		;;
        2m)	color="LightBlue"
                add_seperator=false
		;;
        2n)	color="LightPurple"
                add_seperator=false
		;;
        2o)	color="LightCyan"
                add_seperator=false
		;;
        2p)	color="White"
                add_seperator=false
		;;
	?)	easy_edit_form+=$input_selection
		;;
	*)      echo "Error! Remember, characters must be entered one at a time! / Error! That is not a valid multi-char code!"
		add_seperator=false
		;;
esac
if [ "$add_seperator" == "true" ]; then
easy_edit_form+="%"
fi
done # end of the main while loop

# Saving/Enabling:


fi # end of the start confirmation if
