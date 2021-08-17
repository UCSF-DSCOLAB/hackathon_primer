#!/bin/bash
echo Set your workding directory. This is the directory where all your work will be saved.
read dir
docker run -it -p 8888:8888 -v $dir:/home/data drbueno/single-cell-nb:latest


