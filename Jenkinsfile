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
                 // Load the Groovy template file
                def templateFile = load 'groovy-html.template'

                // Generate email content using the template
                def emailContent = templateFile.generateEmailContent(currentBuild)
                
                emailext(
                    subject: "Build Notification: ${currentBuild.fullDisplayName}",
                    body: '''${SCRIPT, template="groovy-html.template"}''',
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
