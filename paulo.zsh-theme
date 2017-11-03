function my_git_prompt() {
  tester=$(git rev-parse --git-dir 2> /dev/null) || return

  INDEX=$(git status --porcelain 2> /dev/null)
  STATUS=""

  # is branch ahead?
  if $(echo "$(git log origin/$(git_current_branch)..HEAD 2> /dev/null)" | grep '^commit' &> /dev/null); then
    STATUS="$STATUS$ZSH_THEME_GIT_PROMPT_AHEAD"
  fi

  # is anything unstaged?
  if $(echo "$INDEX" | command grep -E -e '^[ MARC][MD] ' &> /dev/null); then
    STATUS="$STATUS$ZSH_THEME_GIT_PROMPT_UNSTAGED"
  fi

  # is anything staged?
  if $(echo "$INDEX" | command grep -E -e '^(D[ M]|[MARC][ MD]) ' &> /dev/null); then
    STATUS="$STATUS$ZSH_THEME_GIT_PROMPT_STAGED"
  fi

  # is anything untracked?
  if $(echo "$INDEX" | grep '^?? ' &> /dev/null); then
    STATUS="$STATUS$ZSH_THEME_GIT_PROMPT_UNTRACKED"
  fi

  # is anything unmerged?
  if $(echo "$INDEX" | command grep -E -e '^(A[AU]|D[DU]|U[ADU]) ' &> /dev/null); then
    STATUS="$STATUS$ZSH_THEME_GIT_PROMPT_UNMERGED"
  fi

  if [[ -n $STATUS ]]; then
    STATUS=" $STATUS"
  fi

  echo "$ZSH_THEME_GIT_PROMPT_PREFIX$(my_current_branch)$STATUS$ZSH_THEME_GIT_PROMPT_SUFFIX"
}

function my_current_branch() {
  echo $(git_current_branch || echo "(no branch)")
}

function ssh_connection() {
  if [[ -n $SSH_CONNECTION ]]; then
    echo "%{$fg_bold[red]%}(ssh) "
  fi
}


PROMPT='%(?:△ :%{$fg_bold[red]%}△ %s)'
local ret_status="%(?:%{$fg_bold[green]%}➜ :%{$fg_bold[red]%}➜ )"

RPROMPT='%{$fg_bold[cyan]%}${PWD/#$HOME/~}%{$reset_color%}$(my_git_prompt)'

ZSH_THEME_GIT_PROMPT_PREFIX=" %{$fg_bold[green]%}"

# ✚ ✖ ● ✹ ➜ ✭
# falta pushar
ZSH_THEME_GIT_PROMPT_AHEAD="%{$fg_bold[magenta]%}committed"
# falta add e commitar
ZSH_THEME_GIT_PROMPT_UNSTAGED="%{$fg_bold[red]%}unstaged"
# falta commitar
ZSH_THEME_GIT_PROMPT_STAGED="%{$fg_bold[yellow]%}staged"
# falta add
ZSH_THEME_GIT_PROMPT_UNTRACKED="%{$fg_bold[blue]%}untracked"
# falta merge
ZSH_THEME_GIT_PROMPT_UNMERGED="%{$fg_bold[red]%}unmerged"

ZSH_THEME_GIT_PROMPT_SUFFIX="%{$reset_color%}"

ZSH_THEME_GIT_PROMPT_CLEAN=""