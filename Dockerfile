# This is the LSDTopoTools visualisation container
# It includes all the python packages needed to run LSDMappingTools

# Pull base image. We start from the miniconda imade
FROM conda/miniconda3
MAINTAINER Simon Mudd (simon.m.mudd@ed.ac.uk) and Fiona Clubb (clubb@uni-potsdam.de)

# Need this to shortcut the stupid tzdata noninteractive thing
ARG DEBIAN_FRONTEND=noninteractive

# Update conda
RUN conda update -c defaults conda

# Add the conda forge
RUN conda config --add channels conda-forge

# Set the channel
RUN conda config --set channel_priority strict

# Add git so you can clone the lsdmappingtools repo
RUN conda install -y git

# Now add some conda packages
RUN conda install -y numpy scipy pandas matplotlib 

# Now some geospatial tools
RUN conda install -y gdal geopandas shapely fiona rasterio pyproj cartopy descartes utm

# Some stuff for text formatting in images
# This is HUGE so we are not goint to install it for now
# RUN apt-get update --fix-missing && apt-get install -y texlive-fonts-recommended texlive-fonts-extra dvipng

# Some of the plotting tools use ffmpeg
RUN conda install -y ffmpeg

# Set the working directory
WORKDIR /LSDTopoTools

# Copy the startup script
COPY Start_LSDTT.sh /usr/local/bin/
RUN chmod +x /usr/local/bin/Start_LSDTT.sh

