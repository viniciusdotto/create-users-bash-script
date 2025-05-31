#!/bin/bash

# Cria uma lista de diretórios
sudo mkdir /home/publico /home/adm /home/ven /home/sec

# Cria uma lista de grupos
for group in GRP_ADM GRP_VEN GRP_SEC; do
    sudo groupadd $group
done

# Define as permissões dos diretórios
sudo chgrp GRP_ADM /home/adm
sudo chgrp GRP_VEN /home/ven
sudo chgrp GRP_SEC /home/sec

# Define as permissões dos diretórios
sudo chmod 777 /home/publico
sudo chmod 770 /home/adm
sudo chmod 770 /home/ven
sudo chmod 770 /home/sec

# Cria os usuários e adiciona aos grupos
for user in carlos maria joao; do
    sudo useradd $user -m -s /bin/bash -G GRP_ADM
done

for user in debora sebastiana roberto; do
    sudo useradd $user -m -s /bin/bash -G GRP_VEN
done

for user in josefina amanda rogerio; do
    sudo useradd $user -m -s /bin/bash -G GRP_SEC
done

# Define que uma nova senha deve ser definida no primeiro login
users='carlos maria joao debora sebastiana roberto josefina amanda rogerio'

for user in $users; do
    sudo passwd -e $user
done