#!/bin/bash

BASE=$(basename $(pwd))
SESS=${1:-$BASE}

main(){
    # verifica se o tmux está sendo executado
    tmux ls &> /dev/null
    if [[ $? == 0 ]]; then
        # a seção solicitada já existe?
        tmux has-session -t $SESS &> /dev/null
        if [[ $? != 0 ]]; then
            nova_sessao
        fi
    else
        tmux new -s $SESS -c $(pwd)
    fi
}

nova_sessao(){
    echo "criando nova sessão $SESS"
    tmux new -s $SESS -c $(pwd) -d
    tmux switch-client -t $SESS
}

main
