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
                 def emailContent = """
                    <html>
                        <body>
                            <h2>Build Status: ${currentBuild.fullDisplayName}</h2>
                            <p>Build Number: ${currentBuild.number}</p>
                            <p>Build URL: <a href="${env.BUILD_URL}">${env.BUILD_URL}</a></p>
                            <p>Custom Message: Your custom message goes here.</p>
                        </body>
                    </html>
                """
                emailext(
                    subject: "Build Notification: ${currentBuild.fullDisplayName}",
                    body:emailContent,
                    mimeType: 'text/html',
                    to: 'Ramya.Balegara@unisys.com',
                    replyTo: 'Ramya.Balegara@unisys.com',
                    from: 'Ramya.Balegara@unisys.com',
                    attachLog: true
                )
            }
        }
    }
}
