pipeline {
    agent any

    stages {
        stage('Build') 
        {
            steps 
            {
               echo "Calling batch Script"
               def currentDirectory = bat(script: 'echo %CD%', returnStatus: true).trim()
                def batchFilePath = currentDirectory + '\\BuildTools\\BuildScript.bat'
                bat "${batchFilePath}"
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
