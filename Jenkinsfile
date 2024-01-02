pipeline {
   
   // def gitCred = credentials('69a57de4-4bd1-413c-8e2d-196071775985')
   // def gitSource = 'https://github.com/Ramya5814/DemoProject.git'

   
    agent {
        label 'Build Machine - VSIDE 2017'
    }

   environment {
        def  jenkinsCredentialsId = credentials('69a57de4-4bd1-413c-8e2d-196071775985')
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

        stage ('Update README.md') {
           steps {
              echo 'Update the readme.md file'
              powershell ("Get-Date | Out-File .\\README.md -append")
           }
        }
        stage ('Push changes') {
           steps {
            withCredentials([usernamePassword(credentialsId: "${jenkinsCredentialsId}", usernameVariable: 'Username', passwordVariable: 'PASSWORD')]) 
            {
                bat ("""
                  //  git config --local user.name ${Username}
                  //  git config --local user.email ${Username}@unisys.com
                    git remote add readmecheck ${GIT_REPO_URL}
                    git add README.md
                    git commit -m "Modified README.md" 
                    git push origin readmecheck
                """)
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

   // post {
       // always {
          //  script {
               // def templateFile = load 'pipeline.groovy'
               // def emailContent = templateFile.generateEmailContent(currentBuild)
                
                //emailext(
                  //  subject: "Build Notification: ${currentBuild.fullDisplayName}",
                  //  body: emailContent,
                   // mimeType: 'text/html',
                   // to: 'Ramya.Balegara@unisys.com, Kaveesh.Dashora@unisys.com',
                    //replyTo: 'Ramya.Balegara@unisys.com',
                   // from: 'noreply.singularity@unisys.com',
                 //   attachLog: true
               // )
           // }
        //}
   // }
}
