#!/bin/bash
file="COVID-19-geographic-disbtribution-worldwide-2020-04-12.csv"
IFS=$','

round=0
tcase=0
death=0
Astring="dummy"
Bstring="dummy"
Cstring="dummy"
for var in $(cat $file)
do
	#echo $round
	((round+=1))
	Cstring=$Bstring
	Bstring=$Astring
	if [[ $var = "Thailand" ]]; then
		((death=$death+$Bstring))
		((tcase=$tcase+$Cstring))
		#echo "founnded"
	fi
	Astring="$var"
	#echo "Round $round : $Astring || $Bstring || $Cstring"
done
echo "Number of patients infected with Covid-19 in Thailand is $tcase"
infper=$(echo "scale=5; $tcase/660000" | bc)
echo "It is 0$infper % of Thai population."
deathper=$(echo "scale=5; $death*100/$tcase" | bc)
echo "The number of deaths per infected person is $deathper %"
