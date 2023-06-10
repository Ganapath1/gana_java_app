@Library('my-shared-library') _

pipeline{

  agent any
  
  stages{
    
      stage('Git Checkout'){
        
        steps{
          
          script{
          
            gitCheckout(
              branch: "main",
              url: "https://github.com/Ganapath1/gana_java_app.git"
            )
          }
        }
        
      }
  }
}
