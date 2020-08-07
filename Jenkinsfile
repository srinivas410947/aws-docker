node {
  stage 'Checkout'
  checkout scm
  
  stage 'Docker build'
  docker.build('demo')
 
  stage 'Docker push'
  docker.withRegistry('https://164171922319.dkr.ecr.us-east-2.amazonaws.com', 'ecr:us-east-2:aws-personal') {
    docker.image('demo').push('latest')
  stage "removing docker images"
  docker rmi demo 164171922319.dkr.ecr.us-east-2.amazonaws.com/demo
  }
}