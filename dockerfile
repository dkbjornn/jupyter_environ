FROM jupyter/datascience-notebook:2021-11-16

# install python modules
RUN conda install -c conda-forge shap=0.40.0 xgboost=1.5.0 pyjanitor=0.22.0 plotnine=0.8.0

# install R packages from the 2021-11-28 snapshot image of CRAN
RUN Rscript -e "install.packages('janitor', repos='https://cran.microsoft.com/snapshot/2021-11-28/')"

ENV JUPYTER_ENABLE_LAB=yes
ENV ROOT=true
ENV GRANT_SUDO=yes
ENV RESTARTABLE=yes
