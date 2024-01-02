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
                emailext(
                    subject: "Build Notification: Success",
                    body: '''<html>
                                <body>
                                    <h2>Build Status: Success</h2>
                                    <p>Build Number:Success</p>
                                    <p>Build URL:</p>
                                    <p>Custom Message: Your custom message goes here.</p>
                                </body>
                            </html>''',
                    mimeType: 'text/html',
                    to: 'ramyablgr@gmail.com',
                    replyTo: 'ramyablgr@gmail.com',
                    from: 'ramyabalegara@gmail.com'
                )
            }
        }
    }
}
