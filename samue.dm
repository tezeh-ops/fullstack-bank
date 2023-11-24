
Welcom to another deployment of a NODEJS application with Docker-Compose

These application is a NODEJS application that we will deploy in docker in the form of containers and this application we will have 3-container  running:
> Front-end container
> Back-end container
> the DATA-Base container


These application a Banking application the we are trying to deploy.

STeps to follow in this deployment

> Launch and Ec2 instance < ubuntu  t2.miduim >

> Intall the varous tools: usse the REPO cor the commands < https://github.com/tezeh-ops/installation_scripts >
# jenkins
# Docker
# SonarQube ( here wewill run it as a Container on port 9000)
# Trivy  ( it will be our scanning tool to scan our Files for Vulnerabilities)
# Java  v17
# NODEJS  v16



FOR PLUGINS TO INSTALL IN JENKINS :

> SonarQube
> owasp dependency-check 

>NODEJS
> jdk ( Eclipse Temurin installer)

> 