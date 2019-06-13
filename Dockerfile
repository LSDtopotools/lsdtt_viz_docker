# This is the LSDTopoTools visualisation container
# It includes all the python packages needed to run LSDMappingTools

# Pull base image. We start from the miniconda imade
FROM conda/miniconda3
MAINTAINER Simon Mudd (simon.m.mudd@ed.ac.uk) and Fiona Clubb (clubb@uni-potsdam.de)

# Need this to shortcut the stupid tzdata noninteractive thing
ARG DEBIAN_FRONTEND=noninteractive

# Add the conda forge
RUN conda config --add channels conda-forge

# Now add some conda packages
RUN conda install -y numpy scipy pandas matplotlib 

# Now some geospatial tools
RUN conda install -y "gdal=2.3.2" shapely fiona rasterio pyproj cartopy descartes utm

# Now try to fix ssl
RUN conda install -y "openssl=1.0.2"

# Add git so you can clone the lsdmappingtools repo
RUN conda install -y git

# Now geopandas
RUN conda install -y geopandas

# Some stuff for text formatting in images
RUN conda install -y texlive-core

# Set the working directory
WORKDIR /LSDTopoTools

# Copy the startup script
COPY Start_LSDTT.sh /usr/local/bin/
RUN chmod +x /usr/local/bin/Start_LSDTT.sh

