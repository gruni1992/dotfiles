function cdpr
    set -l root (pwd | gsed -nE 's|(.*?/Projects/[^/]+).*|\1|')
    if test -n "$root"
        cd "$root"
    else
        echo "Not inside a Projects folder"
    end
end
