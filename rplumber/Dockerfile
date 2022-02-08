# start from the r-base:3.6.3 image
FROM r-base:3.6.3

# install the linux libraries needed for plumber
RUN apt-get update -qq && apt-get install -y --no-install-recommends \
    git-core \
    libssl-dev \
    libcurl4-gnutls-dev \
    curl \
    libsodium-dev \
    libxml2-dev

# install plumber package
RUN R -e "install.packages('plumber', clean = TRUE)"

# CAUTION WITH THE TAG !!!

# docker build --rm -t rplumber:22.2.0 -t rplumber:latest .
# docker run --rm -p 80:80 rplumber:latest

# docker tag rplumber:22.2.0 rakeshpoduval/rplumber:22.2.0
# docker push rakeshpoduval/rplumber:22.2.0

# docker tag rplumber:22.2.0 rakeshpoduval/rplumber:latest
# docker push rakeshpoduval/rplumber:latest
