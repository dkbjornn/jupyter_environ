# JupyterLab Environment

This repo holds my standard JupyterLab environment I use for projects. Once the repo is cloned, the dockerfile can be used to build the image locally with the command (Adjusting PATH_WHERE_YOU_KEEP_GITHUB_REPOS to where you have them saved on your device):

```bash
docker build -t jupyter_environ:latest PATH_WHERE_YOU_KEEP_GITHUB_REPOS/jupyter_environ/
```

The tag in the above command isn't necessary, but it does make it easier to reference later. To start a new container, the command below can be used. I like to link my GitHub directory to the container to make it easier to save work, but the `-v ~/Documents/GitHub/:/home/jovyan/GitHub` is not needed if you don't want to link the directory. Also, this container is really just for running locally, so I remove the token and password for JupyterLab so that it doesn't cause problems if the browser gets closed or something crashes. This allows it to be accessed as long as the container is running.

```bash
docker run -d -p 8888:8888 -v ~/Documents/GitHub/:/home/jovyan/GitHub --name jupyter_environ dkbjornn/jupyter_environ:latest start-notebook.sh --NotebookApp.token='' --NotebookApp.password=''
```

Now that the container is running, you can access it by opening a browser and pointing it to `localhost:8888`. The terminal doesn't need to stay open since it's running in detached mode, and it can be stopped and started using `docker stop jupyter_environ` and `docker start jupyter_environ`, respectively. 
