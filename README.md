# Software-Services-OCS-Inventory
Repository of descriptive nature for the installation process related to the OCS-Invertary tool in Fertiberia group company.
# Requirements   
In order to complete the installation guide, the following programs must be downloaded:     
- Virtual Box: https://www.virtualbox.org/wiki/Downloads (Select the convenient distribution)
  Follow installation wizard. 
- Vagrant: https://developer.hashicorp.com/vagrant/downloads (Select the convenient distribution)
  Follow installation wizard. 
- OCS-Agent Windows64: https://github.com/OCSInventory-NG/WindowsAgent/releases/download/2.10.1.0/OCS-Windows-Agent-2.10.1.0_x64.zip
- Windows Packager: https://github.com/OCSInventory-NG/Packager-for-Windows/releases/download/2.8/OCS-Windows-Packager-2.8.zip   
  To be able to execute this program, it is also needed the following Microsoft package: https://download.sysinternals.com/files/PSTools.zip
- A fixed IP Address for the VM. This is important so the VM is accesible from any agent in the network. The IP shoud be unique and out of the range of the DHCP server. 

 # Installation Process   
 - Install Virtual Box and Vagrant programs [about 20 min] using the default wizard options.
 - Install the OCS-Agent by unzipping the downloaded file to a local directory.
 - Unzip the Microsoft tools PSTools to a local directory.
 - Unzip the windows packager to a local directory and execute the exe file. In the popup isntallation window, indicate the local directory where PSTools has been unzipped previously. After the initial configuration, close the windows packager.
 - Download the content of this repository and unzip it in the user directory [ex: c:\Users\mario.garcia]. There should be a folder named 'provision', a file named 'vagrantfile' and a bat extension file named 'install.bat'.
 - Execute CMD command or open a windows terminal.
 - Execute the bat extension file and waint until VBox configuration is finished. 
 - Type 'vagrant up' and wait until VBox configuration is finished.

# Execute VM    
You can execute the VM by either run VBox application and open the VM:
   ![image](https://github.com/marioGarciaLopez/software-services-ocs-inventory/assets/143705941/fc739067-646d-4007-a436-537eb17c94ad)      
Or execute 'vagrant ssh' in a windows command terminal:   
![image](https://github.com/marioGarciaLopez/software-services-ocs-inventory/assets/143705941/ca986774-beba-48d0-a806-b8807e900442)   

# First steps   
As first thing to do, a navigator window should be opened in the HOST machine (not the VM) and access the address: https://<VM-IP>/ocsreports. The install initial page will be opened:   
![image](https://github.com/marioGarciaLopez/software-services-ocs-inventory/assets/143705941/51d86cd6-9f1b-4261-bf98-c112f1e62ee5)   
Introduce the data as in the image:  
- MySQL login: ocs
- MySQLPassword: strongPas5w0rd
- Name of Database: ocsweb
- MySQL port: 3306

In the next window, click on 'click here to enter OCS-NG GUI'.   
![image](https://github.com/marioGarciaLopez/software-services-ocs-inventory/assets/143705941/20f1f347-53f3-4f89-81cf-ddd9fe7ca4ad)   
Update the DDBB if necessary:   
![image](https://github.com/marioGarciaLopez/software-services-ocs-inventory/assets/143705941/a7ca8b76-0853-43dd-8639-388f11f57f26)   
 
Once updated click again in 'OCS-NSG GUI' to access the login page:   
![image](https://github.com/marioGarciaLopez/software-services-ocs-inventory/assets/143705941/e7c6664b-5cb3-4d15-b7f9-622fe31ebe8d)   
The default credentials are admin/admin   
Once registered access the menu: configuration->users, select user admin and change the default password.   

# Agent Package Creation   
- Execute the windows packager program (ocsPackager.exe) and fill the following information:   
![image](https://github.com/marioGarciaLopez/software-services-ocs-inventory/assets/143705941/9628d506-0524-4249-abe3-7ba494fe1f6c)
 
Agent Setup File: Select the exe file of the agent. (Mind to remove the filter name in the popup selection window)
Certificate file: Select file 'cacert.pem' in the 'provision' folder of this repository.   
Command line options: /S /NOW /SERVER=https://<IP VM>/ocsinventory /SSL=1 /NOSPLASH /NO_SYSTRAY   
(Be aware <IP VM> should be change for the VM IP)    
/S – Silent   
/NOW – Run Inventory immediately after installation   
/SERVER=https://ocsng.domain.local/ocsinventory – address for reporting, mind the suffix – it’s not ocsreports like for web console!   
/SSL=1 – force using SSL   
/NOSPLASH – no splash screen at startup   
/NO_SYSTRAY – no systray – no need to bother users with new icons. Besides, user notification and interaction work perfectly without it

Press 'next' button and select output file folder in the next one. Press OK again in the next window and wait for the file to be generated.   

Once the file is generated it can be executed in the different PCs and servers. The installation is silent, when it's finished a new service would be found in the Operative System:   

![image](https://github.com/marioGarciaLopez/software-services-ocs-inventory/assets/143705941/dbf4e62f-b182-4a2f-9752-d5cb33cc8c97)   

# Final Steps   











  
