function dcke() {
    docker exec -it "$1" /bin/bash
}

function dckrl() {
    docker restart "$1"; docker logs -f --tail=50 "$1"
}

function dcknets() {
    docker ps -q | xargs -n 1 docker inspect --format '{{ .Name }} {{range .NetworkSettings.Networks}} {{.IPAddress}}{{end}}' | sed 's#^/##'
}
