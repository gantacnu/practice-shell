echo -e "\e[31m Downloading Mongodb repo \e[0m"
cp /root/practice-shell/mongodb.repo /etc/yum.repos.d/mongodb.repo
echo -e "\e[31m Installing mongodb server\e[0m"
yum install mongodb-org -y
echo -e "\e[31m changing listen address\e[0m"
sed -i -e 's/127.0.0.1/0.0.0.0/' /etc/mongod.conf
echo -e "\e[31m  Enabling and starting nginx service\e[0m"
systemctl enable nginx
systemctl restart nginx
