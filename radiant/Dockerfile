# start from the r-base:3.6.3 image
FROM r-base:3.6.3

# system libraries of general use
## install debian packages
RUN apt-get --allow-releaseinfo-change update -qq && apt-get -y --no-install-recommends install \
    libudunits2-dev \
    libgdal-dev

## update system libraries
RUN apt-get --allow-releaseinfo-change update && \
    apt-get upgrade -y && \
    apt-get clean

# 2 Copy necessary files

COPY /renv.lock ./renv.lock
COPY /renv_0.14.0.tar.gz ./renv_0.14.0.tar.gz

# 3 Install R packages 
RUN R CMD INSTALL renv_0.14.0.tar.gz
RUN Rscript -e 'renv::restore(lockfile = "renv.lock", clean = TRUE)'

# 4 esquisse integrated with shiny
RUN mkdir /R
COPY /initialize.R ./R/initialize.R

# 3 Expose port
EXPOSE 8080

# 4 Run esquisser() on  container start
CMD ["R", "-e", "source('/R/initialize.R'); radiant(host = '0.0.0.0', port = 8080)"]

# CAUTION WITH THE TAG !!!

# docker build --rm -t radiant:22.2.0 -t radiant:latest .
# docker run --rm -p 8080:8080 radiant:latest
# http://localhost:8080/

# docker tag radiant:22.2.0 rakeshpoduval/radiant:22.2.0
# docker push rakeshpoduval/radiant:22.2.0

# docker tag radiant:22.2.0 rakeshpoduval/radiant:latest
# docker push rakeshpoduval/radiant:latest

# docker run --rm -p 8000:8000 rakeshpoduval/resquisse:latest
