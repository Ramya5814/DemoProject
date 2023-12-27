pipeline {
    agent any

    stages {
        stage('Build') 
        {
            steps 
            {
               echo "Calling batch Script"
                script {
                    // Use the relativePath step to specify the relative path to the batch file
                    def relativePathToBatchFile = 'BuildTools/BuildScript.bat'
                    def absolutePathToBatchFile = pwd() + '/' + relativePathToBatchFile
                    bat "call ${absolutePathToBatchFile}"
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
