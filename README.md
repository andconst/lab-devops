# lab-devops
## Jenkins setup
I spin up a jenkins instance using docker and docker-compose. I created a volume for persistent data and mount docker sock so i can use dokcer-in-docker. I also mounted .docker directory for docker login credentials.
To trigger the build in jenkins i used poll SCM with url trigger-poll URL plugin. Polling SCM is not the best approach. Using webhooks to trigger the build is more efficient.

## Dockerize python app
To docker the python flask app i used a predefined docker image uwsgi-nginx since is not recommended to use flask in production level. In a best case scenario i would build my own dockerfile using uwsgi.
Also i used nginx-proxy in docker to forward the requests to the python app. In a production level scenario nginx-proxy with be exposed to the outside world and the python app hidden behind it.
For encryption i used nginx-letsencrypt in docker but in order to make this work you need a valid domain name.

## Ansible setup
In order to run the ansible-playbook i created a dockerfile that installs ansible and docker in a python image. The entrypoint of that image is ansible-playbook command.
The ansible playbook installs and runs all 3 docker containers (python app, nginx-proxy, nginx-letsencrypt).

## Docker-compose
I also created a docker-compose file that spins up the 3 docker containers. Using docker-compose gives you the flexibility to start, stop the containers, pull new images and all the other commands that docker-compose offers.
