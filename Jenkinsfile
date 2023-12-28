pipeline {
    agent any

    stages {
        stage('Build') 
        {
            steps 
            {
               echo "Calling batch Script"
                script {
                    bat 'BuildTools/BuildScript.bat'
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
