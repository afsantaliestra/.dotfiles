alias dck='docker'
alias dc='docker-compose'

alias dcksc='docker ps'
alias dcksca='docker ps -a'
alias dcksi='docker images'
alias dcksv='docker volume ls'
alias dcksn='docker network ls'
alias dcks='docker ps; echo ""; docker images; echo ""; docker volume ls; echo ""; docker network ls'

alias dckr='docker restart'
alias dckl='docker logs -f --tail=50'

alias dckclsc='docker rm -f $(docker ps -a)'
alias dckclsi='docker rmi -f $(docker images -a )'
alias dckclsv='docker volume prune -f'
alias dckclsn='docker network rm $(docker network ls -q)'
alias dckcls='dckclsc; echo ""; dckclsi; echo ""; dckclsv; echo ""; dckclsn'
alias dckclsp='docker rm -f $(docker ps -aq); echo ""; docker rmi -f $(docker images -q); echo ""; docker volume prune -f; echo ""; docker network rm $(docker network ls -q); echo ""; docker builder prune -fa' 
