#!/bin/bash

# This is a startup script for LSDMappingTools
# It clones the LLSDMappingTools repository into the LSDTopoTools directory
# Author: SMM
# Date: 13/12/2018

# clone or pull the repo, depending on what is in there
# check if the files have been cloned
if [ -f /LSDTopoTools/LSDMappingTools/readme.asc ]
  then
    echo "The LSDMappingTools repository exists, updating to the latest version."
    git --work-tree=/LSDTopoTools/LSDMappingTools --git-dir=/LSDTopoTools/LSDMappingTools/.git  pull origin master
  else
    echo "Cloning the LSDMappingTools repository"
    git clone https://github.com/LSDtopotools/LSDMappingTools.git /LSDTopoTools/LSDMappingTools
fi
