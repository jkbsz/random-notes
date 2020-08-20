#!/bin/bash

SSH_AGENT_PID=$(pgrep -o ssh-agent)
LOCAL_AUTH_SOCK=~/.ssh_auth_sock

if [ -z "$SSH_AGENT_PID" ] ; then
    echo "Starting new ssh-agent..."
    eval $(ssh-agent)
    ln -fs "$SSH_AUTH_SOCK" ${LOCAL_AUTH_SOCK}
    #ssh-add
else
    echo "Reusing ssh-agent at ${SSH_AGENT_PID}"
    export SSH_AGENT_PID
    export SSH_AUTH_SOCK=${LOCAL_AUTH_SOCK}
fi
