alias composer='docker-compose -f /home/vscode/workspace/vscode-devcontainer-php/.devcontainer/docker-compose.yml -p codespaces-compose run --rm --workdir="$(pwd)" composer'

alias mongo='docker-compose -f /home/vscode/workspace/vscode-devcontainer-php/.devcontainer/docker-compose.yml -p codespaces-compose run --rm --workdir="$(pwd)" mongo mongo'
