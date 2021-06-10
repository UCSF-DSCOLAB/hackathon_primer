# Python Single Cell Notebook
This repo contains the Dockerfile and sample data with tutorial used to create the python-single-cell-notebook container. 

This container comes pre-installed basic single cell tools in Python (3.8). Sample Data with tutorial also included.

Container creates Jupyter notebook on local computer. 
- Users can start analyzing single cell sequencing data with Scanpy, plotting with seaborn, modeling with scipy, etc.  

## Requirements:
Docker

## Pull image from Docker hub 
After installing docker, pull the repository from docker hub. 

```docker pull drbueno/python-single-cell```

## Using Mac or Ubuntu 
Clone repo. Open command line window, and change directory to where repo was downloaded to. 

Set the local working directory as environment (env) variable. 

```export DIR=/your/work/dir```

- in  start.sh ```DIR``` is the env variable. If you change env name, also change env name in start.sh

Once env variable to is set, run script. 

```bash start.sh```


Jupyter lab should pop up in browser or click the link with IP address. 




