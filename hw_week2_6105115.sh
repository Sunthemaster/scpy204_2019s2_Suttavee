#!/bin/bash
read -p "Enter your name : " name
while [ -z $name ]
do
        echo "Error, plese enter your name."
	read -p "Enter your name : " name
done
read -p "How old are you : " age
while ! [[ $age =~ ^[0-9]+$ ]]
do
	echo "Error, please enter number of your age only."
        read -p "How old are you : " age
done
read -p "Enter your gender(male,female or others) : " gender
while [ -z $gender ]
do
        echo "Error, plese enter your gender."
        read -p "Enter your gender(male,female or others) : " gender
done
read -p "Have you just returned from a foreign country in the past 14 days? (yes/no) : " ans
while ! [ $ans == "yes" -o $ans == "no" ]
do
	echo "Error, please enter only yes or no."
	read -p "Have you just returned from a foreign country in the past 14 days?(yes/no) : " ans
done
if [ $ans = "yes" ]; then
	read -p "Do you feel sore throat or suffocate?(yes/no): " ans
	while ! [ $ans == "yes" -o $ans == "no" ]
	do
       		echo "Error, please enter only yes or no."
		read -p "Do you feel sore throat or suffocate?(yes/no): " ans
	done
	if [ $ans = "yes" ]; then
		echo "Please go to see a doctor right away!! You are at risk of Covid-19."
		exit 1
	fi
fi
read -p "Are you ill, or caring for someone who is ill?(yes/no) : " ans
while ! [ $ans == "yes" -o $ans == "no" ]
do
        echo "Error, please enter only yes or no."
        read -p "Are you ill, or caring for someone who is ill?(yes/no) : " ans
done
if [ $ans = "yes" ]; then
	echo "Please go to see a doctor right away!! You are at risk of Covid-19."
	exit 1
fi
read -p "How many days have you been self-qurantined at home? : " ans
while ! [[ $ans =~ ^[0-9]+$ ]]
do
	echo "Please enter number only."
        read -p "How many days have you been self-qurantined at home? : " ans
done
if [ $ans -le 14 ]; then
	echo -e "If you feel sore or suffocate in the coming 14 days. \nyou shuould go to see a doctor."
else
	echo "Congratulation! You are free from Covid-19."
fi
exit 0
