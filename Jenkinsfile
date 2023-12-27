pipeline {
    agent any

    stages {
        stage('Build') 
        {
            steps 
            {
               echo "Calling batch Script"
                script {
                    def currentDirectory = bat(script: 'echo %CD%', returnStatus: true).trim()
                    def batchFilePath = "${currentDirectory}\\BuildTools\\BuildScript.bat"
                    bat script: batchFilePath, returnStatus: true
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
