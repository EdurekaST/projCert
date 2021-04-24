node{

    stage('SCM Checkout')
    {
        
	git credentialsId: '2bccf5ab-a1b5-43f3-8588-e16af6751125', url: 'https://github.com/EdurekaST/projCert.git'
    }
    
    stage('Pull PHP Website')
    {
    checkout([$class: 'GitSCM', branches: [[name: '*/master']], extensions: [], userRemoteConfigs: [[credentialsId:'2bccf5ab-a1b5-43f3-8588-e16af6751125', url: 'https://github.com/EdurekaST/projCert.git']]])
    }

}

