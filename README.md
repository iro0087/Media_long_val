# Media_long_val
Simple script that gets the duration of a media (mkv, mp4, mp3...) displayed in different formats

## **Usage**

bash longueur.sh -i input_file --> x1hour x2min x3secs

bash longueur.sh -i input_file -u s --> x sec (gets the smallest and nearest integer)

bash longueur.sh -i input_file -u hour --> x hour (...)

bash longueur.sh -i input_file -u min --> x min (...)

## **Alias**

If you want to use it as an everyday command, put it as an alias

Example in your .bashrc: alias long="~/path_to_script/longueur.sh"
