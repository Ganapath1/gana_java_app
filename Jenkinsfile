@Library('my-shared-library') _

pipeline{

  agent any
  
  parameters{
    
    choice(name: 'action', choices: 'create\ndelete', description: 'choose create or destroy' )
    
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
    stage('Unit test maven'){
    when { expression { params.action == 'create'} }   
        steps{  
          script{
            mvnTest()
          }
        }
        
      }
    stage('maven integration test'){
    when { expression { params.action == 'create'} }   
        steps{  
          script{
            mvnIntegrationTest()
          }
        }
        
      }
    stage('static code analysis: sonarqube'){
    when { expression { params.action == 'create'} }   
        steps{  
          script{
            def SonarQubecredentialsId = 'sonarqube-api'
            statiCodeAnalysis(SonarQubecredentialsId)
          }
        }
        
      }
    stage('quality gate status: sonarqube'){
    when { expression { params.action == 'create'} }   
        steps{  
          script{
            def SonarQubecredentialsId = 'sonarqube-api'
            qualityGateStatus(SonarQubecredentialsId)
          }
        }
      }    
    stage('mvn build'){
    when { expression { params.action == 'create'} }   
        steps{  
          script{
            mvnBuild()
          }
        }
      }
  }
}
