pipeline {
    agent any

    stages {
        stage('Build') {
            steps {
               echo "Calling single line batch command"
               dir("BuildTools"){
               bat "BuildScript.bat"
            }
        }
        stage('Test') {
            steps {
                echo 'Testing..'
            }
        }
    }
}
