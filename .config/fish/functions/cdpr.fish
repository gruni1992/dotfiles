function cdpr
    set -l root (pwd | gsed -E 's|(.*?/Projects/[^/]+).*|\1|')
    if test -n "$root"
        cd "$root"
    else
        echo "Not inside a Projects folder"
    end
    cd $(pwd | gsed -E 's|(.*?/Projects/[^/]+).*|\1|')
end
