#!/bin/bash

unit="norm"

while getopts ":i:u:" options; do         
                                          
  case "${options}" in                     
    
    i)                                    
      name=${OPTARG}

      find $name > /dev/null 2>$1

      ex=$?

      if [ "$ex" -eq 1 ]
      then 
        echo "file does not exist"
        exit 1
      fi

      ;;

    u)

      unit=${OPTARG} 

      if [ "$unit" != "s" ] && [ "$unit" != "min" ] && [ "$unit" != "hour" ]
      then
        echo "units are only 's', 'min' or 'hour'" 
        exit 1
      fi
      ;;

    :)
      echo "options are -i (input file) and -u (unit)"
      exit 1                      
      ;;

    *)

      echo "options are -i (input file) and -u (unit)"
      exit 1

  esac
done

#a=$(mediainfo $name | grep Duration | awk 'FNR==1 {print $3}') here with mediainfo if you do not want to install ffmpeg for some reason

#b=$(mediainfo $name | grep Duration | awk 'FNR==1 {print $5}')

a=$(ffprobe -i $name -show_entries format=duration -v quiet -of csv="p=0")

str="hour"

str2="min"

str3="sec"

if [ "$unit" = "s" ]
then
        echo "${a}s"
fi

if [ "$unit" = "min" ]
then
        min=$(bc <<< "$a/60")
        echo "${min}min"
fi

if [ "$unit" = "hour" ]
then
        hour=$(bc <<< "$a/3600")
        echo "${hour}hour"
fi

if [ "$unit" = "norm" ]
then

  hour1=$(bc -l <<< "$a/3600") #decimal

  hour2=$(echo "$hour1/1" | bc) # int

  min1=$(bc -l <<< "($hour1-$hour2)*60") #decimal

  min2=$(echo "$min1/1" | bc) #int

  sec=$(bc -l <<< "($min1-$min2)*60") #decimal 

  echo "${hour2}hour ${min2}min ${sec}s"

fi

exit 0                                    
