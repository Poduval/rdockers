# rdockerservices
Building docker containers with r services.

# contents 

## rplumber

Docker container with R Base image + plumber package. Use `docker pull rakeshpoduval/rplumber:latest` to download.

## rserve

<https://www.rforge.net/Rserve/>

Docker container with R Base image + Rserve package. Use `docker pull rakeshpoduval/rserve:latest` to download and `docker run --rm -p 80:80 rserve:latest` to execute. Once it is executed visit <http://localhost:8000/> to access the tool. 

## resquisse

Docker container with R Base image + esquisse (depdencies includes ggplot2 & shiny). Use `docker pull rakeshpoduval/resquisse:latest` to download and `docker run --rm -p 8000:8000 rakeshpoduval/resquisse:latest` to execute. Once it is executed visit <http://localhost:8000/> to access the tool. 

## radiant

Docker container with R Base image + radiant. Use `docker pull rakeshpoduval/radiant:latest` to download and `docker run --rm -p 8080:8080 rakeshpoduval/radiant:latest` to execute. Once it is executed visit <http://localhost:8080/> to access the tool. 
