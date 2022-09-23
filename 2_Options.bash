#!/bin/bash
# Explications : https://dascritch.net/post/2018/01/08/En-20-lignes-pas-plus-%3A-g%C3%A9rer-les-options-d-appel-de-tes-scripts-bash

set -e
while [ '-' == "${1:0:1}" ] ; do
    case "${1,,}" in
        -h|--help)
            echo "${HELP}"
            exit 0
        ;;
        -u|--unlock)
            _unlock_script
            exit 0
        ;;
        -v|--verbose)
            VERBOSE="y"
            option_sub_script="${option_sub_script} --verbose"
        ;;
        -i|--interactive)
            ALWAYS_AUTO="n"
            option_sub_script="${option_sub_script} --interactive"
        ;;
        --)
            shift
            break
        ;;
        *)
          echo "Invalid \"${1}\" option. See ${0} --help"
          exit 1
       ;;
    esac
    shift
done
