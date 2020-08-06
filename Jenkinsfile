node {
  stage('Checkout') {
 // Get CalibrationResults from GitHub
    checkout([  
            $class: 'GitSCM', 
            branches: [[name: 'refs/heads/master']], 
            doGenerateSubmoduleConfigurations: false, 
            extensions: [[$class: 'RelativeTargetDirectory', relativeTargetDir: 'CalibrationResults']], 
            submoduleCfg: [], 
            userRemoteConfigs: [[credentialsId: 'git_credentials', url: 'https://github.com/srinivas410947/aws-docker.git']]
        ])
  stage 'Docker build'
  docker.build('demo')
 
  stage 'Docker push'
  docker.withRegistry('https://164171922319.dkr.ecr.us-east-2.amazonaws.com', 'ecr:us-east-2:aws-personal') {
    docker.image('demo').push('latest')
  }
}