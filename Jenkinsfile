node {
          stage ('checkout'){
           git branch: 'master', credentialsId: 'gitcredentials', url: 'https://github.com/Anusha0503/docker-3.git'
 
         }
   stage ('build'){ 
        withMaven(globalMavenSettingsConfig: '', jdk: 'java', maven: 'maven', mavenSettingsConfig: '', traceability: true) {
        sh 'mvn clean package'
                  }
              }
    stage ('docker build image'){
      sh " docker build -t docker-3:v1 ."
    }
     stage ('docker tag&Push image'){
               sh " docker login -u mydocker1405 -p Password@123 "
               sh " docker tag docker-3:v1 mydocker1405/docker-3:$BUILD_NUMBER "
               sh  " docker push mydocker1405/docker-3:$BUILD_NUMBER "
     }
     stage (' deploy to k8s'){
     sshagent(['kubernetes_pem']) {
               sh " scp -o stricthostkeychecking=no docker-3-deployment.yaml ubuntu@54.91.203.20:/home/ubuntu"
               sh " scp -o stricthostkeychecking=no docker-3-service.yaml ubuntu@54.91.203.20:/home/ubuntu"        
               sh " ssh ubuntu@54.91.203.20  kubectl apply -f docker-3-deployment.yaml"
               sh " ssh ubuntu@54.91.203.20  kubectl apply -f docker-3-service.yaml"
          }
       }
     }
