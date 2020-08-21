pipeline {
  environment {
    registry = '164171922319.dkr.ecr.us-east-2.amazonaws.com/demo'
    registryCredential = 'aws-personal'
    dockerImage = 'testing'
  }
  agent any
  stages {
    stage('Building image') {
      steps{
        script {
          dockerImage = docker.build registry + ":$BUILD_NUMBER"
        }
      }
    }
    stage('Deploy image') {
        steps{
            script{
                docker.withRegistry("https://" + registry, "ecr:us-east-2:" + registryCredential)
                    dockerImage.push()
                
            }
        }
    }
    stage ('Removing images') {
	   steps{
	      script{
		     sh """
			   docker ps -a \
			    | awk '{ print \$1,\$2 }' \
			    | grep imagename \
			    | awk '{print \$1 }' \
			    | xargs -I {} docker rm -f {}
			  """
			 }
	   }
    }
  }
}
