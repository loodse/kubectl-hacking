# add or source in ~/.bashrc

function _update_ps1() {
    if [ -z $POWERLINE_THEME ]; then
        export POWERLINE_THEME=default
        ### use for presentations
        #export POWERLINE_THEME=low-contrast
    fi
    PS1="$(powerline-go -theme $POWERLINE_THEME -cwd-max-depth 5 -newline -modules "termtitle,kube,venv,user,host,ssh,cwd,perms,git,hg,jobs,exit,root,vgo" -error $?)"
}

# e.g. used to set for intellij terminal
if [ "$TERM" != "linux" ]; then
    PROMPT_COMMAND="_update_ps1; $PROMPT_COMMAND"
fi