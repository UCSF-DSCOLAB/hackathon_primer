#!/bin/bash
echo Set working directory.
read dir
docker run -it -p 8888:8888 -v $dir:/home/data drbueno/python-single-cell:latest
