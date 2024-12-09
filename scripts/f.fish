function vzsh
    vim ~/.zshrc
    source ~/.zshrc
    cap
end

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

function k
    kubectl $argv
end

function kg
    kubectl get $argv
end

function kgp
    kubectl get pods $argv
end

function kdefault
    kubectl config set-context --current --namespace=$argv
end

function sd
    cap
    sudo shutdown -h now
end

function newfile
    mkdir -p (dirname $argv[1])
    touch $argv[1]
end
