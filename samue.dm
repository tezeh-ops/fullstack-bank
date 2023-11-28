
Welcom to another deployment of a NODEJS application with Docker-Compose

These application is a NODEJS application that we will deploy in docker in the form of containers and this application we will have 3-container  running:
> Front-end container
> Back-end container
> the DATA-Base container


These application a Banking application the we are trying to deploy.

STEPS TO FOLLOW TO DEPLOPLY THE APP

> Launch and Ec2 instance < ubuntu  t3.xlarge>

> Intall the varous tools: usse the REPO cor the commands < https://github.com/tezeh-ops/installation_scripts >
# jenkins
# Docker
# SonarQube ( here wewill run it as a Container on port 9000)
# Trivy  ( it will be our scanning tool to scan our Files for Vulnerabilities)
# Java  v17
# NODEJS  v16



FOR PLUGINS TO INSTALL IN JENKINS :

> SonarQube ( and configure it to talk to the SonarQube server using token)

> owasp dependency-check  ( and configure it: to set up < dependency-check> in the tool config after we have install it plugin: < go to too : click add< dependency-check> entere any name e.g < DC > then
        // click < install automatically > the select the drop down and < select using GitHub> then choose any version and < apply/save 
 )

>NODEJS ( we can can install it on our pos or set the plugin up in the jenkins UI )

> jdk ( Eclipse Temurin installer) ( we can also configure it under tools with different version and point them out in our jenkinsfile  as seen it our jenkinsfile)

> sonar-scanner { And onfigure it under Tools  }

> 
