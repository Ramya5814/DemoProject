pipeline {
    agent {
        label 'windows'
    }

    stages {
        stage('Build') 
        {
            steps 
            {
               echo "Calling batch Script"
                script {
                    // Use the relativePath step to specify the relative path to the batch file
                    def batchFilePath = bat(script: 'echo %CD%', returnStatus: true).trim() + '\\BuildTools\\BuildScript.bat'
                    bat "${batchFilePath}"
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
