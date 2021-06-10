#!/bin/bash
docker run -it -p 8888:8888 -v $DIR:/home/data drbueno/python-single-cell:latest
