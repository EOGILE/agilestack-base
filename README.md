# AGILESTACK #

CMS for mobile and IOT


## What is this repository for? ##

* This repository contains the source code and examples of agilestack reloaded
* Version [NO VERSION]


## How do I get set up? ##


### Prerequisites ###

* Have GO latest version installed (1.6.0+)
* Have Docker latest version installed with docker-compose
* Have Node (v5+) & npm (v3.8+) installed
* Have webpack installed : `npm install webpack -g`

#### specific on Mac OSX ####

* [docker toolbox](https://docs.docker.com/installation/mac/) highly recommended
* Run at least once `Docker Quickstart Terminal`
* Once everything installed, you can either access the app using the docker machine IP (usually `192.168.99.100`), 
  or optionally setup port forwading between Mac host and docker host running inside virtual box VM, to access the app using `localhost` :
    1. Open Virtual Box
    1. Go to your VM (should be default)
    1. Configure you VM
    1. Go to Network tab
    1. Advanced
    1. Port forwarding, and add redirections :
        * port 8080 to 8080 : this is for the proxy, which is the frontend for the backoffice, and the plugins
        * port 8501 to 8501 : this is for tests using consul


### Installation ###

First you have to clone the repository in you GOPATH : `$GOPATH/src/github.com/eogile/agilestack-base`

In a terminal launched with all the docker environment variable setup (launched with `Docker Quickstart Terminal` in Mac OSX):

    cd $GOPATH/src/github.com/eogile/agilestack-base
    docker network create agilestacknet
    docker volume create --name agilestack-shared
    docker-compose up

You should be able to browse to `http://localhost:8080`


### How to develop ###

To develop on AgileStack, you need to additionally clone the following repositories :

* `agilestack-core`: The core app
* `agilestack-utils`: Utils used by many components
* `agilestack-root-app`: The root web app, and the "builder"
* `agilestack-plugin-manager`
* `agilestack-hydra-host`
* `agilestack-login-ui`
* `agilestack-secu-admin`

You can also clone :

* `agilestack-root-app-test`
* `agilestack-ui-plugin-boilerplate`

Then run global commands from `$GOPATH/src/github.com/eogile/agilestack-base`.

Setup the different modules (eg. fetch or update the go dependencies with):

    make setup

Build from `agilestack-base` with:

    make

Run the newly created images with:

    docker-compose -f docker-compose-dev.yml up

### How to run tests ###

    cd $GOPATH/src/github.com/eogile/agilestack-base
    make test

Sometimes, with the current version the tests are stuck, you'll have to re-run an everything should be fine


### How to publish docker images ###

After having built and tested:

    cd $GOPATH/src/github.com/eogile/agilestack-base
    docker login
    make docker


## Contribution guidelines ##

* Writing tests : TODO
* Code review : TODO
* Other guidelines : TODO


## Who do I talk to? ##

* Repo owner or admin : TODO
* Other community or team contact : TODO
