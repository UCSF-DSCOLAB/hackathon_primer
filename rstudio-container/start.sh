#!/bin/bash
echo Set your workding directory. This is the directory where all your work will be saved.
read dir

docker run -p 8787:8787 -e PASSWORD=@hackathon2021 -v $dir:/home drbueno/rstudio-single-cell