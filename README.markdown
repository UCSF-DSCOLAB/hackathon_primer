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

## How to Run Using Mac or Ubuntu 
Clone repo. Open command line window, and change directory to where repo was downloaded to. 

Run 
```./start.sh```

You will be prompted to set your working directory. This is the directory where the data lives. 
ALL work must be done in this directory. It will be mounted inside the container in ```/home/data```

After entering the path of your local work directory, follow instructions to copy and paste link with 
IP address to a web browser.


## Running Scanpy Tutorial

The Jupyter Notebook with Scanpy tutorial for Preprocessing and clustering 3k PBMCs path is here:
```/home/tutorial/```

Open Jupyter notebook file ```scanpy-tutorial.ipynb``` and run tutorial. 








