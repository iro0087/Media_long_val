# Media_long_val
Simple script that gets the duration of a media (mkv, mp4, mp3...) displayed in different formats

## **Requirements**

ffmpeg

## **Usage**

- bash longueur.sh -i input_file --> x1hour x2min x3secs

- bash longueur.sh -i input_file -u s --> x sec 

- bash longueur.sh -i input_file -u hour --> x hour (gets the smallest and nearest integer)

- bash longueur.sh -i input_file -u min --> x min (gets the smallest and nearest integer)

## **Alias**

If you want to use it as an everyday command, put it as an alias

Example in your .bashrc: alias long="bash ~/path_to_script/longueur.sh"

## Example 
![long_000](https://github.com/iro0087/Media_long_val/assets/114911243/fc162345-c50f-4e7e-aeb8-0a0bbd556de0)

