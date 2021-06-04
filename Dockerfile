FROM continuumio/miniconda3:latest

WORKDIR /home

COPY env.yaml .


RUN conda env create -f env.yaml -n work &&\
    echo "conda activate work" >> ~/.bashrc &&\
    conda clean -afy &&\
    rm env.yaml

ENV PATH=/opt/conda/envs/work/bin/:${PATH}

WORKDIR /tutorial

COPY example-data .
COPY scanpy-tutorial.ipynb .

WORKDIR /

CMD ["jupyter", "lab",  "--allow-root", "--port=8888", "--no-browser", "--ip=0.0.0.0"]
