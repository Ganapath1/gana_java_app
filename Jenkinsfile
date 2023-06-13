@Library('my-shared-library') _

pipeline{

  agent any
  
  parameters{
    
    choice(name: 'action', choices: 'create\ndelete', description: 'choose create or destroy' )
    string(name:'ImageName', description:'name of the docker build', defaultValue:'java_app')
    string(name:'ImageTag', description:'image tag of the docker build', defaultValue:'v1')
    string(name:'DockerHubUser', description:'username of the docker', defaultValue:'ganapath1')
  }
  
  stages{
    
      stage('Git Checkout'){
      when { expression { params.action == 'create'} } 
        
        steps{
          
            gitCheckout(
              branch: "main",
              url: "https://github.com/Ganapath1/gana_java_app.git"
            )
          }
        
      }
//     stage('Unit test maven'){
//     when { expression { params.action == 'create'} }   
//         steps{  
//           script{
//             mvnTest()
//           }
//         }
        
//       }
//     stage('maven integration test'){
//     when { expression { params.action == 'create'} }   
//         steps{  
//           script{
//             mvnIntegrationTest()
//           }
//         }
        
//       }
//     stage('static code analysis: sonarqube'){
//     when { expression { params.action == 'create'} }   
//         steps{  
//           script{
//             def SonarQubecredentialsId = 'sonarqube-api'
//             statiCodeAnalysis(SonarQubecredentialsId)
//           }
//         }
        
//       }
//     stage('quality gate status: sonarqube'){
//     when { expression { params.action == 'create'} }   
//         steps{  
//           script{
//             def SonarQubecredentialsId = 'sonarqube-api'
//             qualityGateStatus(SonarQubecredentialsId)
//           }
//         }
//       }    
    stage('mvn build'){
    when { expression { params.action == 'create'} }   
        steps{  
          script{
            mvnBuild()
          }
        }
      }
    stage('Docker build'){
    when { expression { params.action == 'create'} }   
        steps{  
          script{
            dockerBuild("${params.ImageName}","${params.ImageTag}","${params.DockerHubUser}")
          }
        }
      }
    stage('Docker Image scan using trivy'){
    when { expression { params.action == 'create'} }   
        steps{  
          script{
            trivy("${params.ImageName}","${params.ImageTag}","${params.DockerHubUser}")
          }
        }
      }
  }
}
