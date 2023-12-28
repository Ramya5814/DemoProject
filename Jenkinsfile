pipeline {
    def gitSource = "https://github.com/Ramya5814/DemoProject.git"
    agent {
        label 'Build Machine - VSIDE 2017'
    }

    tools {
        // Specify the name of the Git installation configured in Jenkins
        git url: "${gitSource}", branch: 'main'
    }
    stages {
        stage('Build') 
        {
            steps {
                // This step will use the specified Git installation
                checkout scm
                echo "Calling batch Script"
                bat 'BuildTools/BuildScript.bat'
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
