#!/bin/bash
echo Set your workding directory. This is the directory where all your data lives and where all files/code will be saved. \
Please enter full path.
read dir

architecture=$(uname -m)

if [ "$architecture" == "arm64" ]; then
    docker run -d --rm \
     -p 8787:8787 \
     -e PASSWORD=@hackathon2025 \
     -v $dir:/home \
     hackathon_r
    echo "please navigate to: http://localhost:8787/"
else
    docker run -d --rm \
     -p 8787:8787 \
     -e PASSWORD=@hackathon2025 \
     -v $dir:/home \
     hackathon_r
    echo "please navigate to: http://localhost:8787/"
fi
