# my_git_prompt_info_status() from mortalscumbag.zsh-theme
# better than git_prompt_info() + git_prompt_status() on .oh-my-zsh/lib/git.zsh
# because of the STAGED|UNSTAGED behavior
function my_git_prompt_info_status() {
  tester=$(git rev-parse --git-dir 2> /dev/null) || return
  
  INDEX=$(git status --porcelain 2> /dev/null)
  STATUS=""

  # is branch ahead?
  if $(echo "$(git log origin/$(git_current_branch)..HEAD 2> /dev/null)" | grep '^commit' &> /dev/null); then
    STATUS="$STATUS$ZSH_THEME_GIT_PROMPT_AHEAD"
  fi

  # is branch behind?
  if $(echo "$(git log HEAD..origin/$(git_current_branch) 2> /dev/null)" | grep '^commit' &> /dev/null); then
    STATUS="$STATUS$ZSH_THEME_GIT_PROMPT_BEHIND"
  fi

  # is anything staged?
  if $(echo "$INDEX" | command grep -E -e '^(D[ M]|[MARC][ MD]) ' &> /dev/null); then
    STATUS="$STATUS$ZSH_THEME_GIT_PROMPT_STAGED"
  fi

  # is anything unstaged?
  if $(echo "$INDEX" | command grep -E -e '^[ MARC][MD] ' &> /dev/null); then
    STATUS="$STATUS$ZSH_THEME_GIT_PROMPT_UNSTAGED"
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
    STATUS="$STATUS"
  fi

  echo "$ZSH_THEME_GIT_PROMPT_PREFIX$(my_current_branch)$STATUS$ZSH_THEME_GIT_PROMPT_SUFFIX"
}

function my_current_branch() {
  echo $(git_current_branch || echo "(no branch)")
}

function ssh_connection() {
  if [[ -n $SSH_CONNECTION ]]; then
    echo "%{$CYAN%}(ssh) "
  fi
}

# colors
local WHITE=$fg_bold[white]
local RED=$fg_bold[red]
local YELLOW=$fg_bold[yellow]
local GREEN=$fg_bold[green]
local BLUE=$fg_bold[blue]
local CYAN=$fg_bold[cyan]
local MAGENTA=$fg_bold[magenta]
local ret_status="%(?:%{$WHITE%}:%{$RED%})"


# left
PROMPT='$(ssh_connection)${ret_status} '
# right
RPROMPT='%{$CYAN%}${PWD/#$HOME/~}$(my_git_prompt_info_status)$(git_remote_status)'

# my_git_prompt_info_status()
ZSH_THEME_GIT_PROMPT_PREFIX=" %{$GREEN%}"
ZSH_THEME_GIT_PROMPT_SUFFIX="%{$reset_color%}"
ZSH_THEME_GIT_PROMPT_AHEAD="%{$MAGENTA%} committed" # ↑
ZSH_THEME_GIT_PROMPT_BEHIND="%{$GREEN%} committed behind" # ↓
ZSH_THEME_GIT_PROMPT_STAGED="%{$YELLOW%} staged" # ●
ZSH_THEME_GIT_PROMPT_UNSTAGED="%{$RED%} unstaged" # ●
ZSH_THEME_GIT_PROMPT_UNTRACKED="%{$BLUE%} untracked" # ●
ZSH_THEME_GIT_PROMPT_UNMERGED="%{$RED%} unmerged" # ✕

# git_remote_status() from .oh-my-zsh/lib/git.zsh
ZSH_THEME_GIT_PROMPT_EQUAL_REMOTE=""
ZSH_THEME_GIT_PROMPT_AHEAD_REMOTE=" AHEAD_REMOTE"
ZSH_THEME_GIT_PROMPT_BEHIND_REMOTE=" BEHIND_REMOTE"
ZSH_THEME_GIT_PROMPT_DIVERGED_REMOTE=" DIVERGED_REMOTE"
