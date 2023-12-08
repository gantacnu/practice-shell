echo -e "\e[31m Installing nginx service \e[0m"
yum install nginx -y
echo -e "\e[32m removing default content \e[0m"
cd /usr/share/nginx/html
rm -rf *
echo -e "\e[33m Downloading new app content\e[0m"
curl -O https://roboshop-artifacts.s3.amazonaws.com/frontend.zip
unzip frontend.zip
echo -e "\e[34m Enabling and starting nginx service\e[0m"
systemctl enable nginx
systemctl restart nginx