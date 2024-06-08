abbr -a c cargo
abbr -a e nvim
abbr -a vim nvim
abbr -a m make
abbr -a g git
abbr -a vimdiff 'nvim -d'

if command -v eza >/dev/null
    alias l=eza
    alias ls=eza
    alias ll='eza -l'
    alias la='eza -la'
else
    alias l=ls
    alias ll='ls -l'
    alias la='ls -la'
end

function d
    while test $PWD != /
        if test -d .git
            break
        end
        cd ..
    end
end

eval $(/opt/homebrew/bin/brew shellenv)


setenv FZF_DEFAULT_COMMAND 'fd --type file --follow'
setenv FZF_CTRL_T_COMMAND 'fd --type file --follow'
setenv FZF_DEFAULT_OPTS '--height 20%'

setenv MANPAGER 'less -R --use-color -Dd+r -Du+b'

function fish_user_key_bindings
    bind \cz 'fg>/dev/null ^/dev/null'
    if functions -q fzf_key_bindings
        fzf_key_bindings
    end
end


eval "$(pyenv init -)"

# Zoxide setup
zoxide init fish | source
alias cd=z

source /opt/homebrew/opt/asdf/libexec/asdf.fish

direnv hook fish | source

# iex history
export ERL_AFLAGS="-kernel shell_history enabled"

export XDG_CONFIG_HOME="$HOME/.config"
export LIBRARY_PATH="$LIBRARY_PATH:$(brew --prefix)/lib"
