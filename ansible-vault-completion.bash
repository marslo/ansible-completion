#!/bin/env bash

_ansible-vault() {
    local current_word=${COMP_WORDS[COMP_CWORD]}
    local previous_word=${COMP_WORDS[COMP_CWORD - 1]}
    local options="create decrypt edit encrypt encrypt_string rekey view"

    case $previous_word in
        create|decrypt|edit|encrypt|encrypt_string|rekey|view)
            options="--debug --vault-id --ask-vault-password --vault-password-file --verbose --output --encrypt-vault-id -J -v -h --help"
            if [[ "$current_word" == -* ]]; then
                COMPREPLY=( $( compgen -W "$options" -- "$current_word" ) )
            fi
            ;;
        *)
            COMPREPLY=( $( compgen -fdW "$options" -- "$current_word" ) )
            ;;
    esac
}

complete -o default -F _ansible-vault ansible-vault
