pipeline {
   
   // def gitCred = credentials('69a57de4-4bd1-413c-8e2d-196071775985')
   // def gitSource = 'https://github.com/Ramya5814/DemoProject.git'

   
    agent {
        label 'Build Machine - VSIDE 2017'
    }

   environment {
        def  jenkinsCredentialsId = credentials('Kaveesh Github Credentials')
        def GIT_REPO_URL = 'https://github.com/Ramya5814/DemoProject.git'
    }
   
    stages {
        stage('Build') 
        {
            steps {
                // This step will use the specified Git installation
                echo "Calling batch Script"
                dir('BuildTools') {
                bat 'BuildScript.bat'
                }
            }
            
        }
       stage('Load and Execute Script') {
            steps {
                script {
                    def myScript = load 'pipeline.groovy'
                    myScript.printMessage()
                }
            }
        }

       stage('Archive Artifacts')
        {
            steps {
                archiveArtifacts artifacts: 'Artifacts/*.*',
                           allowEmptyArchive: true,
                           fingerprint: true,
                           onlyIfSuccessful: true
            }
        }
        stage('Test') 
        {
            steps 
            {
                echo 'Testing..'
            }
        }
       
     post {
        always {
            script {

               def myScript = load 'pipeline.groovy'
               myScript.printMessage()
               
                def templateFile = load 'pipeline.groovy'
                def emailContent = templateFile.generateEmailContent(currentBuild)
                
                emailext(
                    subject: "Build Notification: ${currentBuild.fullDisplayName}",
                    body: emailContent,
                    mimeType: 'text/html',
                    to: 'Ramya.Balegara@unisys.com', 
                    //Kaveesh.Dashora@unisys.com',
                    replyTo: 'Ramya.Balegara@unisys.com',
                    from: 'noreply.singularity@unisys.com',
                    attachLog: true
                )
            }
        }
    }
}
}
