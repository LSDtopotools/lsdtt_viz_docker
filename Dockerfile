# This is the LSDTopoTools visualisation container
# It includes all the python packages needed to run LSDMappingTools

# Pull base image. We start from the miniconda imade
FROM conda/miniconda3
MAINTAINER Simon Mudd (simon.m.mudd@ed.ac.uk) and Fiona Clubb (clubb@uni-potsdam.de)

# Need this to shortcut the stupid tzdata noninteractive thing
ARG DEBIAN_FRONTEND=noninteractive

# Add a bunch of utilities that will be used to fetch data
RUN apt-get update && apt-get install -y git ffmpeg wget tzdata

# Update conda
RUN conda update -n base -c defaults conda

# Add the conda forge
RUN conda config --add channels conda-forge

# Set the channel
#RUN conda config --set channel_priority strict

# Use python 3.6.7
#RUN conda install -y python=3.6.7

# Now add some conda packages
RUN conda install -y -c conda-forge numpy scipy pandas=0.24.2 matplotlib gdal geopandas shapely fiona rasterio pyproj cartopy descartes utm

# Some stuff for text formatting in images
# This is HUGE so we are not goint to install it for now
# RUN apt-get update --fix-missing && apt-get install -y texlive-fonts-recommended texlive-fonts-extra dvipng

# Set the working directory
WORKDIR /LSDTopoTools

# Copy the startup script
COPY Start_LSDTT.sh /usr/local/bin/
RUN chmod +x /usr/local/bin/Start_LSDTT.sh

# Copy the script for fetching example data 
COPY Get_LSDTT_example_data.sh /usr/local/bin/
RUN chmod +x /usr/local/bin/Get_LSDTT_example_data.sh
