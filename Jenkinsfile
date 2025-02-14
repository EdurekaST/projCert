pipeline {
    agent none
    stages {
        stage('install puppet on slave') {
            agent { label 'slave' }
            steps {
                echo 'Install Puppet'
                sh "wget -N -O 'puppet.deb' https://apt.puppetlabs.com/puppet6-release-bionic.deb"
                sh 'chmod 755 puppet.deb'
                sh 'sudo dpkg -i puppet.deb'
                sh 'sudo apt update'
                sh 'sudo apt install -y puppet-agent'
            }
        }

        stage('configure and start puppet') {
            agent { label 'slave' }
            steps {
                echo 'configure puppet'
                sh 'mkdir -p /etc/puppetlabs/puppet'
                sh 'if [ -f /etc/puppetlabs/puppet/puppet.conf ]; then sudo rm -f /etc/puppetlabs/puppet.conf; fi'
                sh "echo '[main]\ncertname = node1.local\nserver = puppet' >> ~/puppet.conf"
                sh 'sudo mv ~/puppet.conf /etc/puppetlabs/puppet/puppet.conf'
                echo 'start puppet'
                sh 'sudo systemctl start puppet'
                sh 'sudo systemctl enable puppet'
            }
        }

       stage('Install Docker and version') {
            agent { label 'slave' }
            steps {                
                    echo 'start Install Docker on slave through puppet'                    
                }
            }            

        stage('Pull PHP Website') {
            agent { label 'slave' }
            steps {
                sh 'cd /home/ubuntu/projCert/projCert && sudo git pull https://github.com/EdurekaST/projCert.git'
            }
        }

        stage('Docker Build and Run') {
            agent { label 'slave' }
            steps {
                sh "sudo docker --version"
                sh "cd /home/ubuntu/projCert && sudo docker build -t test ."
                sh "sudo docker run -it -d --name webapp -p 1998:80 test"                
            }
        }

        stage('Setting Prerequisite for Selenium') {
            agent { label 'slave' }
            steps {
                sh "wget -N -O 'firefox-57.0.tar.bz2' http://ftp.mozilla.org/pub/firefox/releases/57.0/linux-x86_64/en-US/firefox-57.0.tar.bz2"
                sh 'tar -xjf firefox-57.0.tar.bz2'
                sh 'rm -rf /opt/firefox'
                sh 'sudo mv firefox /opt/'             
            }
        }
    }
}