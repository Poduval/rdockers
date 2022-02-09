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
COPY /app.R ./R/app.R

# 3 Expose port
EXPOSE 8000

# 4 Run esquisser() on  container start
CMD ["R", "-e", "shiny::runApp('/R', host = '0.0.0.0', port = 8000)"]

# CAUTION WITH THE TAG !!!

# docker build --rm -t resquisse:22.2.0 -t resquisse:latest .
# docker run --rm -p 8000:8000 resquisse:latest
# http://localhost:8000/

# docker tag resquisse:22.2.0 rakeshpoduval/resquisse:22.2.0
# docker push rakeshpoduval/resquisse:22.2.0

# docker tag resquisse:22.2.0 rakeshpoduval/resquisse:latest
# docker push rakeshpoduval/resquisse:latest
