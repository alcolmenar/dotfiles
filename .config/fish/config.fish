abbr -a c cargo
abbr -a e nvim
abbr -a vim nvim
abbr -a m make
abbr -a g git
abbr -a vimdiff 'nvim -d'

if command -v exa >/dev/null
    alias l=exa
    alias ls=exa
    alias ll='exa -l'
    alias la='exa -la'
else
    alias l=ls
    alias ll='ls -l'
    alias la='ls -la'
end

[ -f /opt/homebrew/share/autojump/autojump.fish ]; and source /opt/homebrew/share/autojump/autojump.fish

function d
    while test $PWD != /
        if test -d .git
            break
        end
        cd ..
    end
end

# Fish git prompt
set __fish_git_prompt_showuntrackedfiles yes
set __fish_git_prompt_showdirtystate yes
set __fish_git_prompt_showstashstate ''
set __fish_git_prompt_showupstream none
set -g fish_prompt_pwd_dir_length 3

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

function fish_prompt
    set_color brblack
    echo -n "["(date "+%H:%M")"] "
    set_color blue
    echo -n (prompt_hostname)
    if [ $PWD != $HOME ]
        set_color brblack
        echo -n ':'
        set_color yellow
        echo -n (basename $PWD)
    end
    set_color green
    printf '%s ' (__fish_git_prompt)
    set_color red
    echo -n '| '
    set_color normal
end

eval "$(pyenv init -)"
zoxide init fish | source
status --is-interactive; and rbenv init - fish | source

alias cd=z

# >>> coursier install directory >>>
set -gx PATH "$PATH:/Users/alcolmenar/Library/Application Support/Coursier/bin"
# <<< coursier install directory <<<

# >>> JVM installed by coursier >>>
set -gx JAVA_HOME "/Users/alcolmenar/Library/Caches/Coursier/arc/https/github.com/adoptium/temurin11-binaries/releases/download/jdk-11.0.22%252B7/OpenJDK11U-jdk_x64_mac_hotspot_11.0.22_7.tar.gz/jdk-11.0.22+7/Contents/Home"
# <<< JVM installed by coursier <<<
