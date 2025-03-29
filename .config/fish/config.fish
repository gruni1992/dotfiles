if status is-interactive
    source ~/scripts/functions.fish
end

# pnpm
set -gx PNPM_HOME "/Users/tobiasgrunwald/Library/pnpm"
if not string match -q -- $PNPM_HOME $PATH
  set -gx PATH "$PNPM_HOME" $PATH
end
# pnpm end
