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








# Prompt format
PROMPT='%(?:🎩  :🚫  %s)'
RPROMPT='%{$fg_bold[cyan]%}${PWD/$HOME/~}%{$reset_color%}$(git_prompt_info)'

# Format for git_prompt_info()
ZSH_THEME_GIT_PROMPT_PREFIX=" %{$fg_bold[green]%}"
ZSH_THEME_GIT_PROMPT_SUFFIX="%{$reset_color%}"

# Format for parse_git_dirty()
ZSH_THEME_GIT_PROMPT_DIRTY="%{$fg_bold[red]%} ●"
ZSH_THEME_GIT_PROMPT_CLEAN=""

