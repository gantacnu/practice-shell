echo -e "\e[31m Installing Nginx Service \e[0m"
yum install nginx -y &>>/tem/roboshop.log
echo -e "\e[31m Removing default server content\e[0m"
cd /usr/share/nginx/html
rm -rf *
echo -e"\e[31m Downloading custom server content \e[0m"
curl -O https://roboshop-artifacts.s3.amazonaws.com/frontend.zip
unzip frontend.zip
echo -e"\e[31m enabling and starting \e[0m"
systemctl enable nginx
systemctl start nginx