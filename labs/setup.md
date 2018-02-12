Pre- reqs:
  Install Virtual Box
  Ubuntu 16-04 LTS iso image
  Virtualisation enabled on the laptop

Virtual Box Settings:
  Network Adapter 1 : NAT
  Network Adapter 1 : Host Only Network

Install Ubuntu.
  Ram > 4096MB
  HDD > 15 Gb
  

Once ubuntu is installed make these configurational changes to the files

1.  vi /etc/network/interfaces

  auto enp0s8
  iface enp0s8 inet static

  address 192.168.56.101
  netmask 255.255.255.0

2. vi /etc/hosts
  192.168.56.101 puppet
  
3. Install updates
  sudo apt-get install updates

4. Install ssh
  sudo apt-get install ssh
  
5. change PermitRootLogin yes in /etc/ssh/sshd_config file
  PermitRootLogin yes
  
  
6. reboot the system:
  sudo reboot
  
7. vi /etc/resolve.conf (this gets reset after reboot)
  Comment the line with .com in it.


8. Once the system is up download/copy the puppet installer in /tmp dir.

Download Link: https://pm.puppetlabs.com/cgi-bin/download.cgi?dist=ubuntu&rel=16.04&arch=amd64&ver=latest

9. extract the contents and run the puppet installer by root user.

10. Once the installation steps are complete it will give you the url with 3000 in the port
 ex: https://<hostname>:3000
  
11. Open this link in mozilla in the ubuntu master VM and complete the installation. This may take around 30-45 mins






