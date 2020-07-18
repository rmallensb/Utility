setopt interactivecomments

#PROMPT='%(!.%{$fg[red]%}.%{$fg[green]%})%~%{$fg_bold[blue]%}$(git_prompt_info)%{$reset_color%} '

PROMPT='%B%F{magenta}r %B%F{blue}%1~%b%f $(vi_mode_prompt_info)'
RPROMPT='%B%F{magenta}$(git_prompt_info)'

ZSH_THEME_GIT_PROMPT_PREFIX="("
ZSH_THEME_GIT_PROMPT_SUFFIX=")"
ZSH_THEME_GIT_PROMPT_DIRTY=" ✗"
ZSH_THEME_GIT_PROMPT_CLEAN=" ✔"
