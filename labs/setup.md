Pre- reqs:<br />
  Install Virtual Box <br />
  Ubuntu 16-04 LTS iso image <br />
  Virtualisation enabled on the laptop <br />

Virtual Box Settings: <br />
  Network Adapter 1 : NAT <br />
  Network Adapter 1 : Host Only Network <br />

Install Ubuntu. <br />
  Ram > 4096MB <br />
  HDD > 15 Gb <br />
  

Once ubuntu is installed make these configurational changes to the files <br />

1.  vi /etc/network/interfaces <br />

  auto enp0s8 <br />
  iface enp0s8 inet static <br />

  address 192.168.56.101 <br />
  netmask 255.255.255.0 <br />

2. vi /etc/hosts
  192.168.56.101 puppet
  
3. reboot the system:<br />
  sudo reboot


4. Install updates<br />
  sudo apt-get install updates

5. Install ssh<br />
  sudo apt-get install ssh
  
6. change PermitRootLogin yes in /etc/ssh/sshd_config file <br />
  PermitRootLogin yes
  
7. restart the ssh service <br />
  service ssh restart
  
8. vi /etc/resolve.conf (this gets reset after reboot)<br />
  Comment the line with .com in it.


9. Once the system is up download/copy the puppet installer in /tmp dir. <br />

Download Link: https://pm.puppetlabs.com/cgi-bin/download.cgi?dist=ubuntu&rel=16.04&arch=amd64&ver=latest

10. extract the contents and run the puppet installer by root user. <br />

11. Once the installation steps are complete it will give you the url with 3000 in the port <br />
 ex: https://<hostname>:3000
 
 
 
 Agent : curl -k https://puppetmaster:8140/packages/current/install.bash | sudo bash 
  
12. Open this link in mozilla in the ubuntu master VM and complete the installation. This may take around 30-45 mins <br />






