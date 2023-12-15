echo -e "\e[31m downloading nodejs repo \e[0m"
curl -sL https://rpm.nodesource.com/setup_lts.x | bash
echo -e "\e[31m installing nodejs server \e[0m"
yum install nodejs -y
echo -e "\e[31m adding user and path \e[0m"
useradd roboshop
mkdir /app
cd /app
echo -e "\e[31m downloading new app content and there dependencencies \e[0m"
curl -O https://roboshop-artifacts.s3.amazonaws.com/catalogue.zip
unzip catalogue.zip
rm -rf catalogue.zip
npm install
echo -e "\e[31m creating catalogue service file  \e[0m"
cp /root/practice-shell/catalogue.service /etc/systemd/system/catalogue.service
systemctl daemon-reload
echo -e "\e[31m downloading and loading the mongodb schema \e[0m"
cp /root/practice-shell/mongo.repo /etc/yum.repos.d/mongodb.repo
yum install mongodb-org-shell -y
mongo --host mongodb.ganta.cloud </app/schema/catalogue.js
echo -e "\e[31m enabling and restarting the  catalogue service \e[0m"
systemctl enable catalogue
systemctl restart catalogue
