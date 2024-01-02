def NUGET_PACKAGES
pipeline {
    agent {
        label 'Build Machine - VSIDE 2017'
    }
    environment {
        // now you are on slave labeled with 'label'
        def workspace = WORKSPACE
        // ${workspace} will now contain an absolute path to job workspace on slave

        workspace = env.WORKSPACE
        // ${workspace} will still contain an absolute path to job workspace on slave

        // When using a GString at least later Jenkins versions could only handle the env.WORKSPACE variant:
        echo "Current workspace is ${env.WORKSPACE}"

        // the current Jenkins instances will support the short syntax, too:
        echo "Current workspace is $WORKSPACE"
        NUGET_PACKAGES='$WORKSPACE\\NuGetPackageCache'
    }
    stages {
        stage('Build') {
            steps {
                // This step will use the specified Git installation
                echo "Calling batch Script"
                dir('BuildTools') {
                    bat 'BuildScript.bat'
                }

                bat 'echo %NUGET_PACKAGES%'
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
