#!/bin/bash


#Name: sendsh.sh
#Version : 1.0
#Written by: Endrit Qerreti
#Copyright (c) Endrit Qerreti 2023


if_mailutils="$(dpkg -l | grep mailutils)"


if [[ -z "$if_mailutils" ]];
then 
echo  -e "mailutils doesn't seem to be installed on your system\nPress enter to install it\n"
read required
install_mailutils="$(sudo apt install mailutils -y)"
else 
echo -e "mailutils is installed, you are good to go ahead and send your email,\npress enter to continue"
read continue
clear

message="Write the message:"
echo -e "\n"$message"\n"
read message

subject="Set the subject:"
echo -e "\n"$subject"\n"
read subject

email="Set the email address you want to send the email to:"
echo -e "\n"$email"\n"
read email



echo -e "\nThe email is being sent to $email"



send_email=$(echo "$message" | mail -s "$subject"  $email)


fi
