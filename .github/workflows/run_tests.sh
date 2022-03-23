#!/bin/bash

set -e

function log {
    type=${1}
    message=${2}

    template="==> [$(date '+%Y-%m-%d %H:%M:%S')]"

    case ${type^^} in
        DEBUG|D)
            echo -e "\n${template} \e[1;30m;[DEBUG]\e[0m ${message}" >&2
            ;;
        INFO|I)
            echo -e "\n${template} \e[1;36m[INFO]\e[0m ${message}" >&2
            ;;
        WARN|W)
            echo -e "\n${template} \e[1;33m;[WARN]\e[0m ${message}" >&2
            ;;
        ERROR|E)
            echo -e "\n${template} \e[1;31m;[ERROR]\e[0m ${message}" >&2
            ;;
        * )
            echo -e "\n${template} \e[1;32m;[LOG]\e[0m Incorrect log type: ${type}" >&2
            ;;
    esac
}

pushd /github/ > /dev/null

log "info" "Running example/scripts/provision-linux.sh"
bash example/scripts/provision-linux.sh

log "info" "npm version $(npm --version)"

log "info" "install yarn"
npm install --global yarn

log "info" "yarn version $(yarn --version)"

log "info" "Running yarn"
yarn

log "info" "Running yarn test"
yarn test

popd