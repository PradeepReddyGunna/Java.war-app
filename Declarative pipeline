pipeline {
    agent any
    stages {
        stage ('checkout/clone') {
            steps {
            git 'https://github.com/PradeepReddyGunna/Java.war-app.git'
            
            }
        }
         stage ('build') {
            steps{
                sh ''' mvn compile '''
            }
        }
        stage ('to scheduling into artifact') {
            steps{
                sh '''mvn clean package '''
            }
        }
          stage ('creating a custom docker image') {
            steps {
                sh ''' docker build -t dynamic .'''
                sh ''' docker images '''
                sh ''' docker tag dynamic gunnapradeepreddy/dynamic:v1'''
            }
        }
        stage ('push into docker') {
            steps {
                script{
                    withDockerRegistry(credentialsId: 'docker-hub') {
                        sh ''' docker push gunnapradeepreddy/dynamic:v1 '''
                    }
                }
            }
        }
          stage('deploy into container') {
            steps{
                sh ''' docker run --name dynamic-con -d -p 9999:8080 gunnapradeepreddy/dynamic:v1 '''
                
            }
        }
    }
}
