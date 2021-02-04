cd /home/ubuntu
rm /home/ubuntu/*.deb
pkgr package --debug /home/ubuntu/openproject
file=`ls openpr*.deb`
echo $file
sudo cp -v "$file" /var/www/html
sudo rm /var/www/html/openproject.latest.deb
sudo ln -s /var/www/html/$file /var/www/html/openproject.latest.deb
