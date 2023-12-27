pipeline {
    agent any

    stages {
        stage('Build') 
        {
            steps 
            {
               echo "Calling batch Script"
               script {
                    // PowerShell script content
                    def powerShellScript = '''
                        Write-Host "Hello from PowerShell"
                        & ".\\BuildTools\\BuildScript.bat"
                    '''
                    powershell(script: powerShellScript, label: 'windows')
                }
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
}
