#!/bin/bash

# An editor to design custom command prompts.
# Quick overview of the code: Since there are certain ASCII codes that only work in the command prompt, and since some 'items' have different lengths of characters, three main string variables exist. One is used to store the design while in the editor (easy_edit_form), another one to display your design in the editor (display_form), and finally the actual string that is saved (full_form). A design is saved by adding a few lines to the end of your .bashrc file. Since a .bashrc file is rather useful, it is backed up prior to saving in case something goes wrong, and is saved as '.bashrc_backup_made_by_bcpe'.

# Some variables
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


# Displayed several times at the top of the screen
header () {
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
}


# Its a very basic loading animation.
sleep_dot () {
echo "."
sleep 1
}


# Updates the variable 'full_form' drawing info from the variable 'easy_edit_form'
update_full_form () {
echo "Updating full form."
var_for_cutting=1
while [[ "$var_for_cutting" -le "$size_of_easy_edit_form" ]]; do
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
	*)	error_reason="Something was found in the sting used to store your custom command line prior to saving it that definetly should not be there."
		terminate_due_to_error
		;;
esac
var_for_cutting=$(($var_for_cutting+1))
done
# full_form+=" "
}	



# Updates the variable 'display_form' with info from variable 'easy_edit_form'
update_display_form () {
echo "Updating display form."
var_for_cutting=1
display_form=""
extra_message=""
while [[ "$var_for_cutting" -le "$size_of_easy_edit_form" ]]; do
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
return
}


# Starts from here
echo "Running this editor will clear your shell, do you want to continue? (y/n)"
read start_confirm
if [ "$start_confirm" != "y" ] && [ "$start_confirm" != "Y" ]; then
echo "Quiting..."; exit
else

echo "If you have not used this editor before, or if you need a refresher, instructions can be found in the README file."
sleep_dot
sleep_dot
sleep_dot
sleep_dot
begin_writing="no"
while [ "$begin_writing" == "no" ]; do # This while loop contains the editor and the color choosing, and exists in order to allow someone to return to the editor prior to saving.
while [ "$main_seg_active" == 1 ]; do # This while loop contains the bulk of the editor.
update_display_form
add_seperator=true
header
echo "'q!' to force quit. 'wr' to write/enable custom prompt."
echo "'rm' to remove last char/item. 'ex' to export as .txt to share your design."
echo "Item codes:"
echo "sp - Insert a 'space'."
echo "1a - Makes computer beep when printed. May not work on all systems."
echo "1b - Current date. Format: Weekday Month Date (ex: Mon January 3)"
echo "1c - Hostname of the machine, with the trailing domain name removed."
echo "1d - Full hostname."
echo "1e - Number of jobs being run by the shell."
echo "1f - Name of the terminal device."
echo "1g - Name of the shell program."
echo "1h - Time in 24 hour format, HH:MM:SS."
echo "1i - Time in 12 hour format, HH:MM:SS."
echo "1j - Time in 12 hour AM/PM format."
echo "1k - Time in 24 hour format, HH:MM."
echo "1l - Username of the current user."
echo "1m - The version of bash in use (x.xx)."
echo "1n - The release of bash in use (x.xx.x)."
echo "1o - The full name of the current directory (ex: ~/Documents/School/Project)."
echo "1p - The last part of the name of the current directory (ex: /Project)."
echo "1q - The history number of this command."
echo "1r - The number of commands run in this shell session."
echo "1s - Displays a $ if logged in as user, instead displays a # if logged in as root."
echo ""
echo "Enter a single character, or a two character command/item: "
read input_selection
case "$input_selection" in
        %) 	echo "I'm sorry, you cannot use a '%' sign. Any other character is allowed!"
		add_seperator=false
		sleep_dot
		sleep_dot
		sleep_dot
		;;
	sp)	easy_edit_form+=" "
		;;
# Commands
        q!)	echo "Program has been manually terminated."; exit
		;;
        rm)	if ((size_of_easy_edit_form>0)); then
		size_of_easy_edit_form=$(($size_of_easy_edit_form-1))
		easy_edit_form=$(echo $easy_edit_form | cut -d '%' -f 1-$size_of_easy_edit_form)
		size_of_easy_edit_form=$(($size_of_easy_edit_form-1)) # Here, the size is reduced again, but the loss is made of for in the 'if' right bellowthis 'case'
		else
		echo "There is nothing to delete!"
		add_seperator=false
		sleep_dot
		sleep_dot
		sleep_dot
		fi
		;;
        wr)	main_seg_active=0
		add_seperator=false
		;;
        ex)	echo "Sorry! Exporting is not yet supported."
		add_seperator=false
		sleep_dot
		sleep_dot
		sleep_dot
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
	?)	easy_edit_form+=$input_selection
		;;
	*)      echo "Error! Remember, characters must be entered one at a time! / Error! That is not a valid multi-char code!"
		add_seperator=false
		sleep_dot
		sleep_dot
                sleep_dot
                sleep_dot
		;;
esac
if [ "$add_seperator" == "true" ]; then
easy_edit_form+="%"
size_of_easy_edit_form=$(($size_of_easy_edit_form+1))
fi
done # end of the main while loop


# Here the color is choosen.
update_display_form
second_seg_active=1
while [ "$second_seg_active" == 1 ]; do
header
echo "Select a color:"
echo -e "Default - 1     \033[1;37mBold White - 2     \033[0;30mBlack - 3     \033[0;31mRed - 4"
echo -e "\033[0;32mGreen - 5     \033[0;33mBrown - 6     \033[0;34mBlue - 7     \033[0;35mPurple - 8"
echo -e "\033[0;36mCyan - 9     \033[0;37mLight Grey - 10    \033[1;30mDark Grey - 11     \033[1;31mLight Red - 12"
echo -e "\033[1;32mLight Green - 13     \033[1;33mYellow - 14     \033[1;34mLight Blue - 15     \033[1;35mLight Purple - 16"
echo -e "\033[1;37mLight Cyan - 17\033[0;37m"
echo "Enter corresponding number:"
read color
full_form=""
defualtselected=false
case "$color" in
        1)	defaultselected=true; colour="Default"; second_seg_active=0
		;;
	2)  full_form+="\[\033[1;37m\]"; colour="Bold White"; second_seg_active=0
                ;;
        3)  full_form+="\[\033[0;30m\]"; colour="Black"; second_seg_active=0
                ;;
        4)    full_form+="\[\033[0;31m\]"; colour="Red"; second_seg_active=0
                ;;
        5)  full_form+="\[\033[0;32m\]"; colour="Green"; second_seg_active=0
                ;;
        6)  full_form+="\[\033[0;33m\]"; colour="Brown"; second_seg_active=0
                ;;
        7)   full_form+="\[\033[0;34m\]"; colour="Blue"; second_seg_active=0
                ;;
        8) full_form+="\[\033[0;35m\]"; colour="Purple"; second_seg_active=0
                ;;
        9)   full_form+="\[\033[0;36m\]"; colour="Cyan"; second_seg_active=0
                ;;
        10)  full_form+="\[\033[0;37m\]"; colour="Light Grey"; second_seg_active=0
                         ;;
        11)       full_form+="\[\033[1;30m\]"; colour="Dark Grey"; second_seg_active=0
                         ;;
        12)       full_form+="\[\033[1;31m\]"; colour="Light Red"; second_seg_active=0
                         ;;
        13) full_form+="\[\033[1;32m\]"; colour="Light Green"; second_seg_active=0
                         ;;
        14)  full_form+="\[\033[1;33m\]"; colour="Yellow"; second_seg_active=0
                 ;;
        15)  full_form+="\[\033[1;34m\]"; colour="Light Blue"; second_seg_active=0
                         ;;
        16)  full_form+="\[\033[1;35m\]"; colour="Light Purple"; second_seg_active=0
                         ;;
        17)  full_form+="\[\033[1;36m\]"; colour="Light Cyan"; second_seg_active=0
                ;;
        *)      echo "Sorry, $color was not an option."
                sleep_dot
                sleep_dot
                sleep_dot
		;;
esac
done # End of color choosing 'while'
update_full_form
if [ "$defaultselected" != "true" ]; then
full_form+="\[\033[0m\] "
fi
confirm_seg_active=1
while [ "$confirm_seg_active" == 1 ]; do # This while loop contain the writing confirmation.
clear
echo "
--- Command Prompt Editor ---
"
echo ""
echo "Enable command prompt:
$display_form
With color: $colour
(y/n)"
read write_confirmation
case "$write_confirmation" in
	y|Y|yes|Yes)	confirm_seg_active=0
		begin_writing=yes
		;;
	n|N|no|No)	confirm_seg_active=0
		clear
		echo "What would you like to do?
	- return to the editor (Enter '1'.)
	- quit without saving (Enter anything else.)"
		read return_or_quit
		if [ "$return_or_quit" == 1 ]; then
		echo "Returning to editor..."
		else
		echo "Program was manually terminated."
		exit
		fi
		;;
	*) 	;;	
esac
done
done

# The actual saving/enabling takes place here:
echo "Saving..."
bashrc=$(less ~/.bashrc)
bashrc+="
# ---Added by the custom command prompt editor---"
bashrc+="
PS1='$full_form'
export PS1"
bashrc+="
# ---End added by the custom command prompt editor---"
mv ~/.bashrc ~/.bashrc_backup_made_by_bcpe
touch ~/.bashrc
echo "$bashrc" | cat > ~/.bashrc
echo "To take effect, you need to start a new shell session. (Close and re-open your terminal.)"
echo "If you wish to undo any changes made, check the README file."
echo "Program complete."
fi # end of the start confirmation if
