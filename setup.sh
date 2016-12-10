#!/bin/bash
echo "---- Iniciando instalacao do ambiente de Desenvolvimento PHP com Laravel Framework ---"

echo -e "\n\n--- Atualizando lista de pacotes ---"
sudo apt-get update

echo -e "\n\n--- Definindo Senha padrao para o MySQL e suas ferramentas ---"

DEFAULTPASS="vagrant"
sudo debconf-set-selections <<EOF
mysql-server	mysql-server/root_password password $DEFAULTPASS
mysql-server	mysql-server/root_password_again password $DEFAULTPASS
dbconfig-common	dbconfig-common/mysql/app-pass password $DEFAULTPASS
dbconfig-common	dbconfig-common/mysql/admin-pass password $DEFAULTPASS
dbconfig-common	dbconfig-common/password-confirm password $DEFAULTPASS
dbconfig-common	dbconfig-common/app-password-confirm password $DEFAULTPASS
phpmyadmin		phpmyadmin/reconfigure-webserver multiselect apache2
phpmyadmin		phpmyadmin/dbconfig-install boolean true
phpmyadmin      phpmyadmin/app-password-confirm password $DEFAULTPASS 
phpmyadmin      phpmyadmin/mysql/admin-pass     password $DEFAULTPASS
phpmyadmin      phpmyadmin/password-confirm     password $DEFAULTPASS
phpmyadmin      phpmyadmin/setup-password       password $DEFAULTPASS
phpmyadmin      phpmyadmin/mysql/app-pass       password $DEFAULTPASS
EOF

echo -e "\n\n--- Instalando pacotes basicos ---"
sudo apt-get install vim curl python-software-properties git-core --assume-yes --force-yes

echo -e "\n\n--- Instalando MySQL, Phpmyadmin e alguns outros modulos ---"
sudo apt-get install mysql-server-5.7 mysql-client phpmyadmin --assume-yes --force-yes

echo -e "\n\n--- Instalando PHP, Apache e alguns modulos ---"
sudo apt-get install php7.0 apache2 libapache2-mod-php7.0 php7.0-curl php7.0-gd php7.0-mcrypt  php7.0-mysql --assume-yes --force-yes

echo -e "\n\n--- Habilitando mod-rewrite do Apache ---"
sudo a2enmod rewrite

echo -e "\n\n--- Reiniciando Apache ---"
sudo service apache2 restart

echo -e "\n\n--- Baixando e Instalando Composer ---"
curl -sS https://getcomposer.org/installer | php
sudo mv composer.phar /usr/local/bin/composer

# Instale apartir daqui o que você desejar 
echo -e "\n\n--- Instalando Ferramenta de Descompactação ---"
sudo apt-get install zip unzip

echo -e "\n\n--- Criando Projeto Laravel ---"
composer global require "laravel/installer"
composer create-project --prefer-dist laravel/laravel /vagrant/www/laravel

echo -e "\n\n--- Configurando Mapeamento do Projeto ---"
sudo cp /var/www/config/laravel.conf.tpl /etc/apache2/sites-available/laravel.conf
sudo ln -s /etc/apache2/sites-available/laravel.conf /etc/apache2/sites-enabled/laravel.conf
sudo rm -R /etc/apache2/sites-enabled/000-default.conf
sudo service apache2 restart

echo -e "\n\n\n\n--- Ambiente de desenvolvimento instalado com sucesso ---"