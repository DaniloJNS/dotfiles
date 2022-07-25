function docker_compose_check
    if test -e ./docker-compose.yml
        echo "File exists"
    else
        echo "File no exists"
        
    end
end
