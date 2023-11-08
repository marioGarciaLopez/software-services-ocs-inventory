# -*- mode: ruby -*-
# vi: set ft=ruby :
IP_ADDRESS = ENV["IP"] || "192.168.56.4"
Vagrant.configure("2") do |config|
  config.vm.box = "bento/ubuntu-22.04"
  config.vm.provider "virtualbox" do |vb|
    vb.gui = true
    vb.name = "OCS-VM"
	vb.memory = 1024*2 # Especifica 2 GB de RAM
	vb.cpus = 1
	#vb.customize ["createhd", "--filename", "ocshd.vdi", "--size", 20480]
  end
  
  config.vm.network "public_network", bridge: "eth0"
  config.vm.network "private_network", ip: IP_ADDRESS

  config.vm.synced_folder "./provision", "/vagrant", disabled: false
  
  config.vm.provision "shell", inline: <<-SHELL     
     sudo apt update -y
	 sudo apt upgrade -y
	 sudo apt install -y git curl wget gcc net-tools network-manager
	 sudo apt install -y mariadb-server mariadb-client
     sudo apt install -y apache2
	 sudo apt-get install -y openssl
	 CERT_DIR="/vagrant"
	 echo "the certificate SSL is going to be generated in '${CERT_DIR}' directory"
	 openssl genrsa -out ${CERT_DIR}/ocsng.key 4096
	 openssl req -x509 -new -nodes -key ${CERT_DIR}/ocsng.key -sha256 -days 1024 -out ${CERT_DIR}/cacert.pem -subj "/C=ES/ST=Madrid/L=Madrid/O=Fertiberia/CN=#{IP_ADDRESS}"
	 cp ${CERT_DIR}/cacert.pem ${CERT_DIR}/ocsng.pem
	 sudo apt install -y libapache-dbi-perl libapache2-mod-perl2 libarchive-zip-perl libdbd-mysql-perl libmojolicious-perl libnet-ip-perl libplack-perl libswitch-perl libxml-simple-perl make
	 sudo apt install -y php php-zip php-pclzip php-gd php-soap php-curl php-json php-mysql
	 sudo apt install -y php-{curl,gd,mbstring,xml}
	 sudo apt -y install perl libcompress-zlib-perl libdbi-perl libsoap-lite-perl libio-compress-perl libapache2-mod-perl2-de
	 sudo cpan -i XML::Entities
	 systemctl restart apache2
	 wget https://github.com/OCSInventory-NG/OCSInventory-ocsreports/releases/download/2.12.0/OCSNG_UNIX_SERVER-2.12.0.tar.gz
	 tar xf /home/vagrant/OCSNG_UNIX_SERVER-2.12.0.tar.gz	 
	 sudo cp /vagrant/setup.sh /home/vagrant/OCSNG_UNIX_SERVER-2.12.0/setup.sh
	 echo "VGNT: Archivo de configuración/instalación OCS sustituido...."
	 cd /home/vagrant/OCSNG_UNIX_SERVER-2.12.0/
	 sudo sh ./setup.sh
	 ls -la /vagrant
	 sudo cp -r /vagrant/apache/* /etc/apache2/
	 sudo cp -r /vagrant/ocsng.pem /etc/ssl/certs/ 
	 sudo cp -r /vagrant/ocsng.key /etc/ssl/private/ 
	 sudo cp -r /vagrant/apache/pass /usr/share/apache2/
	 sudo sh /usr/sbin/update-ca-certificates
	 export IP=#{IP_ADDRESS}
	 envsubst < /etc/apache2/sites-available/000-default.conf > ~/000-default.conf 
	 sudo cp ~/000-default.conf /etc/apache2/sites-available/000-default.conf
	 envsubst < /etc/apache2/sites-enabled/000-default.conf > ~/000-default.conf 	 
	 envsubst < /etc/apache2/sites-enabled/000-default.conf > /etc/apache2/sites-enabled/000-default.conf
	 sudo cp ~/000-default.conf /etc/apache2/sites-enabled/000-default.conf
	 rm ~/000-default.conf
	 sudo rm -rf /z-ocsinventory-server.conf
	 sudo rm -rf /zz-ocsinventory-restapi.conf
	 sudo a2enmod ssl
	 sudo systemctl restart apache2
	 sudo mysql -e "CREATE DATABASE ocsweb;"
	 sudo mysql -u root -p'vagrant' -e "GRANT ALL PRIVILEGES ON ocsweb.* TO ocs IDENTIFIED BY 'strongPas5w0rd';"
	 sudo systemctl restart mysql
	 
  SHELL
  #config.vm.provision :shell, inline: "sudo apt install -y --no-install-recommends ubuntu-desktop" 
  #config.vm.provision :shell, inline: "sudo sed -i 's/127.0.0.1/0.0.0.0/g' /etc/mysql/mariadb.conf.d/50-server.cnf"
  #config.vm.provision :shell, inline: "sudo shutdown -r now"
  #sudo rm -f  /usr/share/ocsinventory-reports/ocsreports/install.php
  
end
