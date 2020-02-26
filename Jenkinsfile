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
                sh "docker run --name teds -d -p 9191:9191 --network jenkins_default teds"
                sh "./testConnection.sh"
                sh "docker rm -f ted"
            }
            post {
                failure {
                    updateGitlabCommitStatus name: 'Test', state: 'failed'
                }
                success {
                    updateGitlabCommitStatus name: 'Test', state: 'success'
                }
            }
        }
    }
}