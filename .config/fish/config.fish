abbr -a c cargo
abbr -a e nvim
abbr -a vim nvim
abbr -a m make
abbr -a g git
abbr -a vimdiff 'nvim -d'
abbr -a lg lazygit
abbr -a man batman

# Kill process fzf
abbr -a kp -- "begin; date; ps -ef; end | fzf --bind='ctrl-r:reload(date; ps -ef)' --header='Press CTRL-R to reload' --header-lines=2 --preview='echo {}' --preview-window=down,3,wrap --layout=reverse --height=80% | awk '{print $2}' | xargs kill -9"

abbr -a lsplog -- 'tail -f ~/.local/state/nvim/lsp.log | bat -pp -f -l log --theme "Solarized (dark)"'

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

eval $(/opt/homebrew/bin/brew shellenv)

set -gx FZF_DEFAULT_COMMAND 'fd --type file --follow'
set -gx FZF_DEFAULT_OPTS '--height 40% --reverse --border --highlight-line --inline-info'
set -gx FZF_CTRL_T_COMMAND "command fd -t f . \$dir 2> /dev/null | sed '1d; s#^\./##'"
set -gx FZF_CTRL_T_OPTS "--preview 'bat -n --color=always {}' --bind 'ctrl-/:change-preview-window(down|hidden)' --preview-window=top,40% --height=100%"

function fish_user_key_bindings
    bind \cz 'fg>/dev/null ^/dev/null'
    if functions -q fzf_key_bindings
        fzf_key_bindings
    end
end

# Zoxide setup
zoxide init fish | source
alias cd=z

mise activate fish | source
mise activate --shims | source

direnv hook fish | source

# iex history
set -x ERL_AFLAGS "-kernel shell_history enabled"
set -x KERL_BUILD_DOCS yes

set -x XDG_CONFIG_HOME "$HOME/.config"

starship init fish | source

source ~/.config/fish/duskfox.fish

set -x EDITOR nvim
