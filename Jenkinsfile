def NUGET_PACKAGES

pipeline {
	agent {
		label 'Build Machine - VSIDE 2017'
    }
    stages {
        stage('Build') {
            steps {
                // This step will use the specified Git installation
                echo "Calling batch Script"
                dir('BuildTools') {
                    bat 'BuildScript.bat'
                }
            }
        }
		stage('Update Readme') {
            script {
                echo "Udpating Readme"
                def branchName = env.BRANCH_NAME
                git credentialsId: '18a8f25b-f3f3-4986-aabc-7c24c11856ac', url: "ssh://git@github.com:Ramya5814/DemoProject.git", branch: branchName
                 sh 'git status'                 
            }
        }
        stage('Archive Artifacts') {
            steps {
                archiveArtifacts artifacts: 'Artifacts/*.*',
                           allowEmptyArchive: false,
                           fingerprint: true,
                           onlyIfSuccessful: true
            }
        }
        stage('Test') {
            steps 
            {
                echo 'Testing..'
            }
        }
    }

    post {
        always {
            script {
                //cleanWs cleanWhenAborted: true, cleanWhenFailure: true, cleanWhenNotBuilt: true, cleanWhenSuccess: true, cleanWhenUnstable: true, deleteDirs: true

                emailext(
                    subject: "Build Notification: ${currentBuild.fullDisplayName}",
                    body: '''${SCRIPT, template="managed:CustomTemplate"}''',
                    mimeType: 'text/html',
                    to: 'Kaveesh.Dashora@unisys.com', 
                    //Kaveesh.Dashora@unisys.com',
                    replyTo: 'Ramya.Balegara@unisys.com',
                    from: 'noreply.singularity@unisys.com',
                    attachLog: true
                )
            }
        }
    }
}
