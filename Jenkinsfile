pipeline {
    agent any

    stages {
        stage('Build') 
        {
            steps 
            {
               echo "Calling batch Script"
                script {
                    bat """echo %COMPUTERNAME%"""
                    echo "${winCompName}"
                }
            }
        }
        stage('Test') 
        {
            steps 
            {
                echo 'Testing..'
            }
        }
    }
}
