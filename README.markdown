# Hackathon Single Cell Notebook
Clone this repo to your computer. 

```git clone git@github.com:UCSF-DSCOLAB/hackathon_primer.git```

This repo contains the Dockerfile and sample data with tutorial used to create the hackathon containers for single-cell 
analysis for both python and R-studio.


The container comes pre-installed with basic single cell tools in Python and R. 
Sample Data with tutorial also included.

Users can start analyzing single cell sequencing data with Scanpy in python or Seurat in R.   

## Requirements:
- Docker

Note: The easiest way to install and use docker, is via docker desktop: https://www.docker.com/products/docker-desktop/

Be sure to select the appropriate installation for you Macbook machine. 

# Running Python Container
## Pull image from Docker hub
After installing docker, pull the repository from docker hub. 

```docker pull drbueno/single-cell-nb:latest```

## How to Run Using Mac or Ubuntu 
Change directory to ```python-container```. 

Run (recommended to run under screen)
```./start.sh```

You will be prompted to set your working directory. This is the directory where the data lives. 
ALL work must be done in this directory. It will be mounted inside the container in ```/home/data```

An example of working directory: `/Users/hackathon-user/UCSF_HACKATHON_PRIMER/python-container/data`

After entering the path of your local work directory, follow instructions to copy and paste link with IP address to a web browser.

### If you are using an M1/M2 Mac

Be sure to have: 

- The latest version of Docker

And in Docker Settings (using docker desktop):

- General -> User Virtualization Framework -> ON
- Features in development -> User Rosetta for x86/amd64 emulation on Apple Silicon -> ON

## Running Scanpy Tutorial

The Jupyter Notebook with Scanpy tutorial for Preprocessing and clustering 3k PBMCs path is here:
```/home/tutorial/```

Open Jupyter notebook file ```python-tutorial.ipynb``` and run tutorial for python.

# How to use if you do not have docker.
Install conda. 
<https://docs.conda.io/projects/conda/en/latest/user-guide/install/index.html>

Change directory to ```python-container```. 

Create single-cell conda environment. 

```conda env create -f env.yaml -n single-cell```

Activate single-cell environment. 

```conda activate single-cell```

Start a jupyter notebook (recommended to run under screen).

```jupyter lab```

The jupyter notebook will have both python and R kernel.
Choose what kernel you want to work with and start
analyzing your data. 

# Running R-studio container 

## Pull image from Docker hub
After installing docker, pull the repository from docker hub. 

```docker pull drbueno/rstudio-single-cell:latest```

## How to Run Using Mac or Ubuntu 
Change directory to ```rstudio-container```. 

Run ```./start.sh```

You will be prompted to set your working directory. This is the directory where the data lives. 
ALL work must be done in this directory. It will be mounted inside the container in ```/home```

An example of working directory: `/Users/hackathon-user/UCSF_HACKATHON_PRIMER/rstudio-container/data`

Go to a web browser and visit 

```localhost:8787```

Log in with username ```rstudio``` and password ```@hackathon2021```

To see the tutorial, open  the ```.Rmd``` file in ```/tutorial```


# How to use with R or R-studio that is already installed on your computer. 

Clone the ```rstudio-container``` repo. 

Change directory to repo, open the command line and run 

```Rscript install_monocle_and_R_dependencies.R```

Your local R or R-studio should have all packages installed needed for single-cell analysis. 

# Installing other packages when using the Docker Containers
If you are going to install other packages, DO NOT stop your containers. If you stop your
containers, the packages that were installed will not exist when you restart the container. 
Instead run the ```./start.sh ```
under ```screen```. When the Hackathon is complete, stop the container. 

# How to stop Container
When the Hackathon is complete. You can stop the container from running.

To see all containers running, type in command line ```docker ps``` 

To stop containers run  ```docker stop <CONTAINER ID>```


# Controlling CPU, Memory, etc.   usage of the container
1. Click docker app icon on your computer. 
2. Click on the setting icon 
3. Once in settings, click on Resources
4. Change the parameters based on need (in the 2021 Hackathon, memory was an issue.)

![img.png](img.png)







