pipeline {
    agent {
        label 'Build Machine - VSIDE 2017'
    }

    stages {
        stage('Build') 
        {
            steps {
                // This step will use the specified Git installation
                checkout scm
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
