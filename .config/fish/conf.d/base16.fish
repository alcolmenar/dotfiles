# Base16 Shell
if status --is-interactive
    set BASE16_SHELL_PATH "$HOME/.config/base16-shell"
    if test -s "$BASE16_SHELL_PATH"
        source "$BASE16_SHELL_PATH/profile_helper.fish"
    end
end
