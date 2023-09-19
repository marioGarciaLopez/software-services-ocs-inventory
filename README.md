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
As first thing to do, a navigator window should be opened in the HOST machine (not the VM) and access the address: https://<fix IP>/ocs-repository. The install initial page will be opened:   
![image](https://github.com/marioGarciaLopez/software-services-ocs-inventory/assets/143705941/51d86cd6-9f1b-4261-bf98-c112f1e62ee5)   
Introduce the data as in the image: 
- user: ocs

![image](https://github.com/marioGarciaLopez/software-services-ocs-inventory/assets/143705941/20f1f347-53f3-4f89-81cf-ddd9fe7ca4ad)   




  
