echo -e "\e[31m Installing Nginx Service \e[0m"
yum install nginx -y
echo -e "\e[31m Removing default server content\e[0m"
cd /usr/share/nginx/html
rm -rf *
echo -e"\e[31m Downloading custom server content \e[0m"
curl -O https://roboshop-artifacts.s3.amazonaws.com/frontend.zip
unzip frontend.zip
rm -rf frontend.zip
echo -e"\e[31m configuring reverse proxy \e[0m"
cp /root/practice-shell/roboshop.conf /etc/nginx/default.d/roboshop.conf
echo -e"\e[31m enabling and starting \e[0m"
systemctl enable nginx
systemctl start nginx
