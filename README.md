---
title: "GDS Bookshelf"
subtitle: "An interactive bundle of open books on Geographic Data Science"
author: "Dani Arribas-Bel"
output:
  tufte::tufte_html: default
---

The GDS Bookshelf is a project to bundle together a few freely available books that relate to Geographic Data Science in an interactive platform that can be accessed online or locally.

## Books

Currently, the shelf includes the following references:

- [*Geographic Data Science with PySAL and the PyData Stack*](https://geographicdata.science/book), by Serge Rey, Dani Arribas-Bel and Levi Wolf.
- [*Geocomputation in R*](https://geocompr.robinlovelace.net/), by Robin Lovelace, Jakub Nowosad and Jannes Muenchow.

## Access the shelf

### Online

You can access the GDS Shelf online, with no install requirements through Binder by clicking on the button below:

[![Binder](https://mybinder.org/badge_logo.svg)](https://mybinder.org/v2/gh/darribas/gds_bookshelf/master)

### Locally

If you prefer, you can run the shelf locally through Docker. Assuming you have Docker installed  on your machine, you can install the shelf by running:

```shell
docker pull darribas/gds_bookshelf
```

This will take a while (among other things, it has to download a copy of the [`gds_env`](https://darribas.org/gds_env/)) and a good internet connection. Once finished, you can run the shelf with the following command:

```shell
docker run --rm \
           -ti \
           -p 8888:8888 \
           darribas/gds_bookshelf
```

Point your browser to `localhost:8888` and copy the token printed on the command line to access the running instance.

### Build

If you would like to build it manually to make sure you are pulling the latest
version of each book, you can do so by downloading the
[`Dockerfile`](Dockerfile) and the [`Makefile`](Makefile) of the project,
placing them on the same directory and, from there, running:

```shell
docker build -t gds_bookshelf .
```

## Suggestions and feedback

If you would like to see more books added to the shelf, please add an [issue on Github](https://github.com/darribas/gds_bookshelf/issues/new) or, even better, feel free to [send a pull request](https://github.com/darribas/gds_bookshelf/pulls).

[![](https://toppng.com/uploads/thumbnail/github-mark-logo-vector-11573976116oq3oau9n10.png)](https://github.com/darribas/gds_bookshelf)

