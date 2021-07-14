FROM continuumio/miniconda3:latest

WORKDIR /home

COPY env.yaml .


RUN conda env create -f env.yaml -n work &&\
    echo "conda activate work" >> ~/.bashrc &&\
    conda clean -afy &&\
    rm env.yaml

ENV PATH=/opt/conda/envs/work/bin/:${PATH}

WORKDIR /home/tutorial

COPY example-data .
COPY python-tutorial.ipynb .
COPY R-tutorial.ipynb .

WORKDIR /home

CMD ["jupyter", "lab",  "--allow-root", "--port=8888", "--no-browser", "--ip=0.0.0.0"]
