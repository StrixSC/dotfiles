function fish_greeting
    set -l image (random choice /home/strix/.config/cows/*)
    if which lolcat > /dev/null ^ /dev/null
        fortune -s | cowsay -f $image | lolcat | /home/strix/Scripts/center.sh
    else if which fortune > /dev/null ^ /dev/null
        fortune -s | cowsay -f $image
    else
        echo Something fishy going on around here ...
    end
end
