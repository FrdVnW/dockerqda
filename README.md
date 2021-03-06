---


# What is it ?

A docker image for easily using RQDA. RQDA is an awesome Gtk+ qualitative data analysis tools for R (a "computer-aided qualitative data analysis", CAQDA).

Docker, container, image ?? *A container image is a lightweight, stand-alone, executable package of a piece of software that includes everything needed to run it: code, runtime, system tools, system libraries, settings.* ([Official doc](https://www.docker.com/what-container))

More on docker on [Pokyah's blog](https://pokyah.github.io/howto/using-r-with-docker/).


# Why ?

This project find its roots in the fact that RQDA dependencies are not easily available/installed in modern distribution of Linux and R.


# How ?

This image proposes the last stable version of RQDA (0.2-8) running in Debian 8 (jessie) and R (3.1)

I use this script to run the image : 

    # Pulling the images
    docker pull frdvnw/dockerqda
    # Exec the script for running the container
    chmod +x RunDockeRQDA.sh
    ./RunDockeRQDA.sh

    #!/bin/bash
    XSOCK=/tmp/.X11-unix
    XAUTH=/tmp/.docker.xauth
    xauth nlist $DISPLAY | sed -e 's/^..../ffff/' | xauth -f $XAUTH nmerge -
    sudo docker run -it --volume=$XSOCK:$XSOCK:rw \
         --volume=$XAUTH:$XAUTH:rw \
         --env="XAUTHORITY=${XAUTH}" \
         --env="DISPLAY" \
         --name whirl_wheels \
         --workdir=/root/ \
         --volume=/WHERE/YOU/WANT/IN/YOUR/COMPUTER/dockerqda/:/home/dockerqda/ \
         frdvnw/dockerqda:latest


# Credits & More info

RQDA is available under [bsd-license](http://rqda.r-forge.r-project.org/License.html). It was coded by [Ronggui HUANG](https://github.com/Ronggui).

Documentations, tutorials, how-tos and other ressources on RQDA can be found on the [main website of the project](http://rqda.r-forge.r-project.org/). 
Devel version of RQDA is in progress on GitHub : <https://github.com/Ronggui/RQDA>

HUANG Ronggui (2016). RQDA: R-based Qualitative Data Analysis. R package version 0.2-8.


# References

Among [references](http://rqda.r-forge.r-project.org/publications.html), I used RQDA for two scientific papers : 

-   [Development of a broadened cognitive mapping approach for analysing systems of practices in social–ecological systems ](https://doi.org/10.1016/j.ecolmodel.2012.11.023)
-   [A new approach for comparing and categorizing farmers’ systems of practice based on cognitive mapping and graph theory indicators](https://doi.org/10.1016/j.ecolmodel.2013.11.026)

