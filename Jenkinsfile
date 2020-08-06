node {
  stage('CheckoutModule1') {
      steps {
          sh 'mkdir -p aws-docker'
          dir("aws-docker")
          {
              git branch: "master",
              credentialsId: 'git_credentials',
              url: 'https://github.com/srinivas410947/aws-docker.git'
          }
      }
  }
  stage 'Docker build'
  docker.build('demo')
 
  stage 'Docker push'
  docker.withRegistry('https://164171922319.dkr.ecr.us-east-2.amazonaws.com', 'ecr:us-east-2:aws-personal') {
    docker.image('demo').push('latest')
  }
}