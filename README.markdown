# Hackathon Single Cell Notebook
This repo contains the Dockerfile and sample data with tutorial used to create the hackathon containers for single-cell 
analysis for both python and R-studio.

The container comes pre-installed with basic single cell tools in Python (3.8) and R (4.1.1). 
Sample Data with tutorial also included.

Container creates Jupyter notebook on local computer. 
- Users can start analyzing single cell sequencing data with Scanpy in python or Seurat in R.   

## Requirements:
Docker

# Running Python Container
## Pull image from Docker hub
After installing docker, pull the repository from docker hub. 

```docker pull drbueno/single-cell-nb ```

## How to Run Using Mac or Ubuntu 
Clone ```python-container``` repo. Open command line window, and change directory to where repo was downloaded to. 

Run 
```./start.sh```

You will be prompted to set your working directory. This is the directory where the data lives. 
ALL work must be done in this directory. It will be mounted inside the container in ```/home/data```

After entering the path of your local work directory, follow instructions to copy and paste link with 
IP address to a web browser.


## Running Scanpy Tutorial

The Jupyter Notebook with Scanpy tutorial for Preprocessing and clustering 3k PBMCs path is here:
```/home/tutorial/```

Open Jupyter notebook file ```python-tutorial.ipynb``` and run tutorial for python.

# How to use if you do not have docker.
Install conda. 
<https://docs.conda.io/projects/conda/en/latest/user-guide/install/index.html>

Clone ```python-container``` repo. Change directory to ```container/```

Create single-cell conda environment. 

```conda env create -f env.yaml -n single-cell```

Activate single-cell environment. 

```conda activate single-cell```

Start a jupyter notebook.

```jupyter lab```

The jupyter notebook will have both python and R kernel.
Choose what kernel you want to work with and start
analyzing your data. 

# Running R-studio container 

## Pull image from Docker hub
After installing docker, pull the repository from docker hub. 

```docker pull drbueno/rstudio-single-cell:latest ```

## How to Run Using Mac or Ubuntu 
Clone ```rstudio-container```repo. Open command line window, and change directory to where repo was downloaded to. 

Run 
```./start.sh```

You will be prompted to set your working directory. This is the directory where the data lives. 
ALL work must be done in this directory. It will be mounted inside the container in ```/home```

Go to a web browser and visit 

```localhost:8787```

Log in with username ```rstudio``` and password ```@hackathon2021```

To see the tutorial, open  the ```.Rmd``` or ```.html``` file in ```/tutorial```

# How to use with R or R-studio that is already installed on your computer. 

Clone the ```rstudio-container``` repo. 

Change directory to repo and run 

```Rscript install_monocle_and_R_dependencies.R```

The R should have all packages installed needed for single-cell analysis. 













