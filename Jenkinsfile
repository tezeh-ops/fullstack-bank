pipeline {
    agent any
    
    tools{                      // refrencing the tools we have set up to use in our  jenkins tool configuration  aand put the tools here we can set differen vesion 
        jdk 'jdk17'
        nodejs 'node16'       // that will fit our projects 
        
    }
    
    environment{
        SCANNER_HOME= tool 'sonar-scanner'  //providint the home path to our sonar tool
    }
    
    stages {
        stage('Git Checkout') {
            steps {
                git branch: 'main', url: 'https://github.com/tezeh-ops/fullstack-bank'
            }
        }
        
        stage('OWASP FS SCAN') { //here we doing dependency checks and we have to install this plugin in jenkin <DC> is the name we call it when configuring the tool in tools
            steps {
                dependencyCheck additionalArguments: '--scan ./app/backend --disableYarnAudit --disableNodeAudit', odcInstallation: 'DC'
                    dependencyCheckPublisher pattern: '**/dependency-check-report.xml'
            }
        } // this plugin is use tserch for any public vulnerability that can be found in our src and give us the result and we have to set up the plugin in jenkin UI and configure the tool
        // to set up < dependency-check> in the tool config after we have install it plugin: < go to too : click add< dependency-check> entere any name e.g < DC > then
        // click < install automatically > the select the drop down and < select using GitHub> then choose any version and < apply/save 

        
        stage('TRIVY FS SCAN') {   // here we are using the tool call Trivy to scan and we have to install it in our OS
            steps {
                sh "trivy fs ."  // here we want to scall all our file for vulnerabilit and the command is < trivy fs . > dot means all the file in the root ans < FS> stand for files
            }
        }
        
        stage('SONARQUBE ANALYSIS') { // runnind analysis on the code ( nb i intall mu sonaqube in my os as a Container) so let go to UI and create a token to configure it on jenkins
            steps {
                withSonarQubeEnv('sonar') {       // here we just provid the server name as we configure it in the credentail tap ==< sonar >
                    sh " $SCANNER_HOME/bin/sonar-scanner -Dsonar.projectName=Bank -Dsonar.projectKey=Bank "  // calling our sonar from the EVN above
                }   // <the -Dsonar.project=Bank >  we are just providing the project name that sonarqube will call it and project key as wdell. 
            }
        }
        
        
         stage('Install Dependencies') {
            steps {
                sh "npm install"
            }
        }
        
        stage('Backend') {
            steps {
                 dir("${WORKSPACE}/app/backend") {   //we i'm using ("${WORKSPACE}") to point the path to my dietory because by default is where  all the build take insted of us using apsolute path to point the directory e.g=   //dir('/root/.jenkins/workspace/Bank/app/backend') {
                    sh "npm install"
                }
            }
        }
        
        stage('frontend') {
            steps {
                 dir("${WORKSPACE}/app/frontend") {   //dir('/root/.jenkins/workspace/Bank/app/backend') {
                    sh "npm install"
                }
            }
        }
        
        stage('Deploy to Conatiner') {
            steps {
                sh "npm run compose:up -d"
            }
        }
    }
} 