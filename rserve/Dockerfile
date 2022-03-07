FROM r-base:3.6.3

## Set a default user. Available via runtime flag `--user rserve`
## User should also have & own a home directory (for rstudio or linked volumes to work properly).
RUN useradd rserve \
	&& mkdir /home/rserve \
	&& chown rserve:rserve /home/rserve

## update system libraries
RUN apt-get update && \
    apt-get upgrade -y && \
    apt-get autoremove -y && \
    apt-get clean && \
    rm -rf /var/lib/apt/lists/*

## install Rserve
RUN R -e "install.packages('Rserve', version='1.8-10', repos = 'http://rforge.net', clean = TRUE)"

## Rserve configuration
RUN mkdir -p /opt/rserve
ENV RSERVE_HOME /opt/rserve

COPY configuration/Rserv.conf /etc/Rserv.conf
RUN mkdir ${RSERVE_HOME}/lib
# COPY configuration/PreLoad.R ${RSERVE_HOME}/lib/PreLoad.R
RUN mkdir ${RSERVE_HOME}/work

## Expose port
EXPOSE 6311

ENV DEBUG FALSE
CMD R --no-save -e "Rserve::Rserve(debug = "${DEBUG}", args=\"--no-save --vanilla\")"


# CAUTION WITH THE TAG !!!

# docker build --rm -t rserve:22.2.0 -t rserve:latest .
# docker run --rm -p 80:80 rserve:latest

# docker tag rserve:22.2.0 rakeshpoduval/rserve:22.2.0
# docker push rakeshpoduval/rserve:22.2.0

# docker tag rserve:22.2.0 rakeshpoduval/rserve:latest
# docker push rakeshpoduval/rserve:latest