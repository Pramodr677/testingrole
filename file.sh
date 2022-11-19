#!/bin/bash
set -x
USER=$1
Key_path=$2
touch datafile
echo "" > datafile
IP=$(terraform output -json Bastion-publicIP | jq -s -r '.[]') 
echo $IP >> datafile
cat datafile
touch Invnetory 
echo "" > Invnetory
echo "[bashton-nodes]" > Invnetory
for line in $(cat datafile)
do
    y=$(echo "${line}") 
    IP=$(echo $y | awk -F, '{print $1}')
    echo "node${j} ansible_host=${IP} ansible_user=${USER} ansible_ssh_private_key_file=${Key_path} ansible_ssh_common_args='-o StrictHostKeyChecking=no'" >> Invnetory
    ((j++)) 
    ((i++))
done
cat Invnetory
rm datafile
touch datafile
echo "" > datafile
IP=$(terraform output -json publicIP | jq -s -r '.[]')  
echo $IP >> datafile
cat datafile
echo "[public]" >> Invnetory
for line in $(cat datafile)
do
    y=$(echo "${line}") 
    IP=$(echo $y | awk -F, '{print $1}')
    echo "node${j} ansible_host=${IP} ansible_user=${USER} ansible_ssh_private_key_file=${Key_path} ansible_ssh_common_args='-o StrictHostKeyChecking=no'" >> Invnetory
    ((j++)) 
    ((i++))
done
cat Invnetory
rm datafile

cat Invnetory
rm datafile
touch datafile
echo "" > datafile
IP=$(terraform output -json publicIP2 | jq -s -r '.[]')  
echo $IP >> datafile
cat datafile
echo "[passive]" >> Invnetory
for line in $(cat datafile)
do
    y=$(echo "${line}") 
    IP=$(echo $y | awk -F, '{print $1}')
    echo "node${j} ansible_host=${IP} ansible_user=${USER} ansible_ssh_private_key_file=${Key_path} ansible_ssh_common_args='-o StrictHostKeyChecking=no'" >> Invnetory
    ((j++)) 
    ((i++))
done
cat Invnetory
rm datafile







touch datafile
echo "" > datafile
IP=$(terraform output -json nginx-nodes-privateIP | jq -r '.[]') 
echo $IP >> datafile
cat datafile
echo "[app]" >> Invnetory
for line in $(cat datafile)
do
    y=$(echo "${line}") 
    IP=$(echo $y | awk -F, '{print $1}')
    echo "node${j} ansible_host=${IP} ansible_user=${USER} ansible_ssh_private_key_file=${Key_path} ansible_ssh_common_args='-o StrictHostKeyChecking=no'" >> Invnetory
    ((j++)) 
    ((i++))
done
cat Invnetory
rm datafile

