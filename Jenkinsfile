pipeline {
    agent {
        label 'Build Machine - VSIDE 2017'
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
    }

    post {
        always {
            script {
                def templateFile = load 'pipeline.groovy'
                def emailContent = templateFile.generateEmailContent(currentBuild)
                
                emailext(
                    subject: "Build Notification: ${currentBuild.fullDisplayName}",
                    body: emailContent,
                    mimeType: 'text/html',
                    to: 'Ramya.Balegara@unisys.com, Kaveesh.Dashora@unisys.com',
                    replyTo: 'Ramya.Balegara@unisys.com',
                    from: 'noreply.singularity@unisys.com',
                    attachLog: true
                )
            }
        }
    }
}
