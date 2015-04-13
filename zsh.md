# ~/.oh-my-zsh/lib/directories.zsh
    alias boss='sudo '
    alias a='atom'
    alias c='clear'
    alias t='touch'
    alias o='open'
    alias ca='cp -r'
    alias rdf='rm -rf'
    alias gs='git status'
    alias gru='grunt'

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
