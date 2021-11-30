FROM jupyter/datascience-notebook

# install python modules
RUN conda install -c conda-forge shap xgboost pyjanitor plotnine cookiecutter

# install R packages from the 2021-11-28 snapshot image of CRAN
RUN Rscript -e "install.packages('janitor', repos='https://cran.us.r-project.org')"

ENV JUPYTER_ENABLE_LAB=yes
ENV ROOT=true
ENV GRANT_SUDO=yes
ENV RESTARTABLE=yes
