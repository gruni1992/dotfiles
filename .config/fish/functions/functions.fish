function vfun
    vim ~/scripts/functions
    source ~/scripts/functions
    cap
end

function vyabai
    vim ~/.config/yabai/yabairc
    source ~/.config/yabai/yabairc
    cap
end

function vskhd
    vim ~/.config/skhd/skhdrc
    cap
end

function vvim
    vim ~/.vimrc
    cap
end

function sd
    cap
    sudo shutdown -h now
end

function newfile
    mkdir -p (dirname $argv[1])
    touch $argv[1]
end

function copyfile
    mkdir -p (dirname $argv[2])
    command cp $argv
end
