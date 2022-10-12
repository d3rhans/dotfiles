#!/bin/bash

function launch_session() {
    tmux new-session -ds $1 -c $2
    tmux send-keys -t $1:1 "vim ." Enter
    tmux rename-window -t $1:1 tex

    tmux new-window -n tools -t $1:2 -c $2

    tmux select-window -t $1:1
    tmux select-pane -t $1:1
}

if [[ $# -eq 1 ]]; then
    selected=$1
else
    selected=$(fd --type d -gH .git ~/Dokumente/Projekte ~/Dokumente/PHD ~/Dokumente/quantum | xargs dirname | fzf)
fi

if [[ -z $selected ]]; then
    exit 0
fi

session_name="lx-$(basename $selected)"
tmux_running=$(pgrep tmux)


if [[ -z $TMUX ]]; then

    if [[ -z $tmux_running ]] || ! tmux has-session -t $session_name 2> /dev/null; then
        launch_session $session_name $selected
    fi

    tmux attach -t $session_name
else
    if ! tmux has-session -t $session_name 2> /dev/null; then
        launch_session $session_name $selected
    fi

    tmux switch-client -t $session_name
fi
