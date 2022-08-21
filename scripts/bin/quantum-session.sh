#!/bin/bash

function launch_session() {
    tmux new-session -ds $1 -c $2
    tmux send-keys -t $1:1.1 "quantum" Enter
    tmux send-keys -t $1:1.1 "vim ." Enter
    tmux send-keys -t $1:1.1 C-L
    tmux rename-window -t $1:1 dev

    tmux split-window -v -t $1:1.1 -c $2
    tmux send-keys -t $1:1.2 "quantum" Enter
    tmux send-keys -t $1:1.2 "ipython" Enter
    tmux send-keys -t $1:1.2 C-L

    tmux new-window -n test -t $1:2 -c $2
    tmux send-keys -t $1:2.1 "quantum" Enter
    tmux send-keys -t $1:2.1 C-L

    tmux new-window -n jupyter -t $1:3 -c $2
    tmux send-keys -t $1:3.1 "quantum" Enter
    tmux send-keys -t $1:3.1 C-L

    tmux select-window -t $1:1
    tmux select-pane -t $1:1.1
    tmux resize-pane -Z -t $1:1.1
}

if [[ $# -eq 1 ]]; then
    selected=$1
else
    # selected=$(find ~/Code/ -name .git -printf '%h\n' | fzf)
    selected=$(fd --type d -gH .git ~/Code | xargs dirname | fzf)
fi

if [[ -z $selected ]]; then
    exit 0
fi

session_name="q-$(basename $selected)"
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
