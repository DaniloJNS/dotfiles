#!/usr/bin/awk -f
@load "filefuncs"

BEGIN {
    cmd = "docker-compose-service.awk < docker-compose.yml"
}

/app|web|api/ {
    service_name =  substr($0, match($0, /api|web|app/), RLENGTH)

    if (RSTART > 0) is_running = 1
}

END { 
    if (is_running == 1) {
        print service_name
        exit 0
    } 

    stat("docker-compose.yml",fdata)
    
    if (length(ERRNO) > 0) {
      print 14   
      exit 0
    }


    while ((cmd | getline service_name) > 0 ) {} 

    close(cmd)

    status = system(sprintf("docker-compose run -d %s sh &> /dev/null", service_name))

    if (status == 0){
        print service_name
        exit 0
    } 

    print status
}
