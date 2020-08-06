node {
  stage 'Checkout'
  git 'ssh://git@github.com/srinivas410947/aws-docker.git'
 
  stage 'Docker build'
  docker.build('demo')
 
  stage 'Docker push'
  docker.withRegistry('https://164171922319.dkr.ecr.us-east-2.amazonaws.com', 'ecr:us-east-2:aws-personal') {
    docker.image('demo').push('latest')
  }
}