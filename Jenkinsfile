// def skipRemainingStages = false
pipeline {
    agent any
    parameters {
        choice choices: ['Apply', 'Destroy'], name: 'Infrastruture'
        string defaultValue: 'Pramodr677', name: 'username'
        password defaultValue: '', name: 'password'
        choice choices: ['ubuntu', 'redhat'], name: 'operating_system'
        choice choices: ['ami-062df10d14676e201','ami-069d9fecd19e7ed40'], name: 'AMI'
        string defaultValue: 't2.medium', description: 'Input instance type', name: 'instance_type'
        string defaultValue: 'mumbairitik', description: 'Input key pair name which you want to provide to your machine & ensure it will be pre-generated', name: 'key_name'
        string defaultValue: '3', description: 'Input node count for your reverse proxy and load balancing', name: 'node_count'
        string defaultValue: 'ubuntu', description: 'Specify the user of your ec2 instances [ubuntu for ubuntu and ec2-user for redhat]', name: 'VM_USER', trim: true
        choice choices: ['apt', 'yum'], description: 'Select package manager i.e. in case of ubuntu -> apt and in redhat -> yum', name: 'Package_manager'
        string defaultValue: 'mumbairitik.pem', description: 'Specify the key pair name of your VM in .pem ext format [for e.g abc.pem]', name: 'Key_pair_name', trim: true
        choice choices: ['1.16.0', '1.18.0', '1.20.0', '1.22.0'], description: 'Select your nginx version', name: 'version'
    }
    stages {
        stage('terraform format check') {
            steps{
                sh 'terraform fmt'
            }
        }
        stage('terraform Init') {
            steps{
                sh 'terraform init'
            }
        }

        stage('terraform destroy'){
            when {
                expression { params.Infrastruture == 'Destroy' }
            }
            steps {
            //     script {
            //         skipRemainingStages = true
            //        input('Do you really want to destroy Infrastructure?')
                 sh 'terraform destroy --auto-approve'
            //     }
            }    
        }
        stage('terraform apply'){
             when {
                expression { params.Infrastruture == 'Apply' }
            }
            steps {
                sh 'terraform apply --auto-approve  -var="ami=${AMI}" -var="instance_type=${instance_type}" -var="key_name=${key_name}" -var="node_count=${node_count}"'
            }
        }
        stage('terraform output'){
           when {
                expression { params.Infrastruture == 'Apply' }
            }
            steps {
                sh'''
                chmod +x file.sh
                ./file.sh $VM_USER /home/$VM_USER/$Key_pair_name
                '''
            }
        }
        
        stage('Copy data'){
            when {
                expression { params.Infrastruture == 'Apply' }
            }
            steps {
                sh'''
                IP=$(terraform output -json Bastion-publicIP | jq -s -r '.[]') 
                echo $IP
                ssh -i "~/$Key_pair_name" -o StrictHostKeyChecking=no -tt $VM_USER@$IP "rm -rf Invnetory $Key_pair_name"
                scp -i "~/$Key_pair_name" -o StrictHostKeyChecking=no -r Invnetory $VM_USER@$IP:~
                scp -i "~/$Key_pair_name" -o StrictHostKeyChecking=no -r ~/$Key_pair_name $VM_USER@$IP:~
                '''
            }
        }
        stage('Configure ansible'){
            when {
                expression { params.Infrastruture == 'Apply' }
            }
            steps {
                sh'''
                IP=$(terraform output -json Bastion-publicIP | jq -s -r '.[]') 
                echo $IP
                ssh -i "~/$Key_pair_name" -o StrictHostKeyChecking=no -tt $VM_USER@$IP "sudo $Package_manager update -y && sudo $Package_manager install git -y && sudo $Package_manager install ansible -y"
                '''
            }
        }
        stage('Git clone'){
            when {
                expression { params.Infrastruture == 'Apply' }
            }
            steps {
                sh'''
                IP=$(terraform output -json Bastion-publicIP | jq -s -r '.[]') 
                echo $IP
                ssh -i "~/$Key_pair_name" -o StrictHostKeyChecking=no -tt $VM_USER@$IP "rm -rf testingrole"
                ssh -i "~/$Key_pair_name" -o StrictHostKeyChecking=no -tt $VM_USER@$IP "git clone https://${username}:${password}@github.com/Pramodr677/testingrole.git"
                '''
            }
        }
        stage('nginx configure'){
            when {
                expression { params.Infrastruture == 'Apply' }
            }
            steps {
                sh'''
                IP=$(terraform output -json Bastion-publicIP | jq -s -r '.[]') 
                echo $IP
                ssh -i "~/$Key_pair_name" -o StrictHostKeyChecking=no -tt $VM_USER@$IP "ansible-playbook -e version=${version} -i Invnetory ~/testingrole/nginxtool/frontplay.yml"
                '''
            }
        }
    }    
}
