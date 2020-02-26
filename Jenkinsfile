pipeline{
    agent any
    options {
        gitLabConnection('MyGitlab')
    }
    stages{
        stage("Build"){
            steps{
                sh "mvn verify"
                
            }
            post {
                failure {
                    updateGitlabCommitStatus name: 'Build', state: 'failed'
                }
                success {
                    updateGitlabCommitStatus name: 'Build', state: 'success'
                }
            }
        }
    }
}