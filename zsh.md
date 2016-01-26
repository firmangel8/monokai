# ~/.oh-my-zsh/lib/directories.zsh
alias boss='sudo '
alias a='atom'
alias c='clear'
alias t='touch'
alias o='open'
alias ca='cp -r'
alias rdf='rm -rf'
alias gs='git status'
alias gc='git commit'
alias gru='grunt'
alias nr='npm run'
alias sv='browser-sync start --no-notify --server --files . --port'
alias obras_a='./sencha app build android --env heroku && adb uninstall br.gov.fnde.obras && adb install -f ./cordova/platforms/android/build/outputs/apk/android-debug.apk && adb logcat | grep -i chrom'
alias educacao_a='./sencha app build android --env production && adb uninstall br.gov.fnde.educacao && adb install -f ./cordova/platforms/android/build/outputs/apk/android-debug.apk && adb logcat | grep -i chrom'
# alias sv='http-server -a localhost -p'
# alias live='livereload . -i 200'
# alias tunnel='~/servers/ngrok http'
# alias vomit="git commit -a -m 'various changes'"


alias md='mkdir -p'
alias rd=rmdir
alias d='dirs -v | head -10'

# List directory contents
alias lsa='ls -lah'
alias l='ls -lah'
alias ll='ls -lh'
alias la='ls -lAh'

# Push and pop directories on directory stack
alias pu='pushd'
alias po='popd'

    https://github.com/robbyrussell/oh-my-zsh/wiki/Cheatsheet


# ~/.zshrc
    # ⭠ ✓ ✗  ➜ ●

    # %* // horas com segundos
    # %D{%L:%M} // horas sem segundos
    # %D{%p} // am/pm

    PROMPT='%(?: :%{$fg_bold[red]%} %s)'
    RPROMPT='%{$fg_bold[cyan]%}${PWD/#$HOME/~}%{$reset_color%}$(git_prompt_info)'

    #relegio %{$fg_bold[yellow]%}%D{%L:%M}%D{%p}%{$reset_color%}

    ZSH_THEME_GIT_PROMPT_PREFIX=" %{$fg_bold[green]%}"
    ZSH_THEME_GIT_PROMPT_SUFFIX="%{$reset_color%}"
    ZSH_THEME_GIT_PROMPT_DIRTY="%{$fg_bold[red]%} ●"
    ZSH_THEME_GIT_PROMPT_CLEAN=""

# ~/.atom/keymap.cson

    'atom-text-editor':
      'cmd-i': 'editor:auto-indent'
      'ctrl-shift-left': 'resize-panes:enlarge-active-pane'
      'ctrl-shift-right': 'resize-panes:shrink-active-pane'
