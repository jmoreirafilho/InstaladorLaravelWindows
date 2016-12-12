# Projeto Laravel Blank #

Servidor LAMP (Linux, Apache, MySQL, PHP)

Configuração do Vagrant (com provisionamento em Shell Script) para criar uma máquina virtual (Ubuntu Server 16.04 64 Bits) de desenvolvimento em PHP, com o Laravel Framework instalado.

### Pacotes Inclusos ###
- PHP 7.0
- MySQL 5.5
- Git
- PhpMyAdmin 
- Composer
- cURL
- Vim
(Para mais detalhes consulte arquivo setup.sh)


## Requisitos Mínimos ##

- Virtualbox - https://www.virtualbox.org/
- Vagrant - http://www.vagrantup.com/
- Git - http://git-scm.com ( Opicional )
- Acesso Internet

## Passo a Passo ##

1. Instale o VirtualBox e em seguida o Vagrant

2. Clone o projeto através do comando `git clone https://github.com/jmoreirafilho/InstaladorLaravelWindows.git`

3. Dentro da pasta do projeto, pelo Terminal, execute o comando `vagrant up`
	- Esse comando, quando executado pela primeira vez pode demorar mais de uma hora, pois irá:
		- Baixar a VM Ubuntu
		- Instalar o php
		- Instalar o mysql e o phpmyadmin
		- Instalar o Laravel na sua ultima versão
		- Baixar todas as libs do Laravel
		- Gerar o Application Key do projeto
		- Mapear o projeto no apache
		- Resetar o apache

4. Acesse o link [localhost:8080](http://localhost:8080) e verifique se uma tela de apresentação do **Laravel** aparece, caso isso ocorra o **Laravel** foi instalado corretamente na sua máquina.

5. Você poderá acessar a sua máquina através do terminal via ssh, digitando `vagrant ssh`

6. Você poderá acessar o seu banco através do PHPMyAdmin pelo link [localhost:8080/phpmyadmin](http://localhost:8080/phpmyadmin)
	- Login: **root**
	- Senha: **vagrant**
