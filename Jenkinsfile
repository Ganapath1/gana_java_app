@Library('my-shared-library') _

pipeline{

  agent any
  
  stages{
    
      stage('Git Checkout'){
        
        steps{
          
            gitCheckout(
              branch: "main",
              url: "https://github.com/Ganapath1/gana_java_app.git"
            )
          }
        
      }
    stage('Unit test maven'){
        
        steps{  
          script{
            mvnTest()
          }
        }
        
      }
    stage('maven integration test'){
        
        steps{  
          script{
            mvnIntegrationTest()
          }
        }
        
      }
  }
}
