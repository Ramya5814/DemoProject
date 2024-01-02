def NUGET_PACKAGES

pipeline {
	agent {
		label 'Build Machine - VSIDE 2017'
    }
    environment {
    	def NuGetExePath='C:\\Program Files (x86)\\NuGet\\nuget.exe'
	NUGET_PACKAGES='${WORKSPACE\\NuGetPackageCache}'
    }
    stages {
        stage('Build') {
            steps {
                // This step will use the specified Git installation
                echo "Calling batch Script"
                dir('BuildTools') {
                    bat 'BuildScript.bat'
                }

                bat 'set'
		bat 'mkdir %NUGET_PACKAGES%'
		bat 'cd %NUGET_PACKAGES%'
		bat 'dir'
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
        stage('Build Notification') {
            steps {
                script {
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
                cleanWs cleanWhenAborted: true, cleanWhenFailure: true, cleanWhenNotBuilt: true, cleanWhenSuccess: true, cleanWhenUnstable: true, deleteDirs: true
            }
        }
    }
}
