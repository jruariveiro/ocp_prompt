OC_PROMPT_SEP='/'

oc_prompt() {
    oc_current_context=$(oc config current-context)
    oc_project=$(echo $oc_current_context | cut -d '/' -f 1)
    oc_cluster=$(echo $oc_current_context | cut -d '/' -f 2 | cut -d '-' -f 2)
    oc_prompt="ocp:($oc_project$OC_PROMPT_SEP$oc_cluster)"
    echo $oc_prompt
}

PROMPT='${ret_status} %{$fg[cyan]%}%c%{$reset_color%} %{$fg_bold[green]%} $(oc_prompt) $(git_prompt_info)%{$reset_color%}'
