pipeline{
    agent any
    options {
        gitLabConnection('MyGitlab')
    }
    stages{
        stage("Build"){
            steps{
                sh "mvn verify"
                sh "cp -f application.properties ./target"
                sh "docker build -t teds ."
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
        stage("Test"){
            steps{
                sh "docker run -d -p 9191:9191 teds"
            }
        }
    }
}