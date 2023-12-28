pipeline {
    agent {
        label 'Build Machine - VSIDE 2017'
    }

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
