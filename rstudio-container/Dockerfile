FROM rocker/rstudio:latest

# 0  Install R packages as root
WORKDIR /home/rstudio
COPY install_monocle_and_R_dependencies.R .
RUN Rscript install_monocle_and_R_dependencies.R && \
    rm install_monocle_and_R_dependencies.R

# 1  Copy tutorial assets (retain root, but give rstudio access)
# Copy and set ownership in one step (requires BuildKit / Docker ≥19.03)
COPY --chown=rstudio:rstudio example-data            /home/rstudio/example-data
COPY --chown=rstudio:rstudio single-cell-tutorial.Rmd /home/rstudio/tutorial/

# OR without BuildKit:
# COPY example-data            /home/rstudio/example-data
# COPY single-cell-tutorial.Rmd /home/rstudio/tutorial/
# RUN chown -R rstudio:rstudio /home/rstudio/example-data /home/rstudio/tutorial

##########################################################
WORKDIR /home/rstudio        # optional; PID 1 still root here
# (no USER rstudio line!)    # ← important
