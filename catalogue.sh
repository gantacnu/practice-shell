echo -e "\e[31m downloading nodejs repo \e[0m"
curl -sL https://rpm.nodesource.com/setup_lts.x | bash &>>/temp/roboshop.log
echo -e "\e[31m installing nodejs server \e[0m"
yum install nodejs -y &>>/temp/roboshop.log
echo -e "\e[31m adding user and path \e[0m"
useradd roboshop
mkdir /app
cd /app
echo -e "\e[31m downloading new app content and there dependencencies \e[0m"
curl -O https://roboshop-artifacts.s3.amazonaws.com/catalogue.zip &>>/temp/roboshop.log
unzip catalogue.zip &>>/temp/roboshop.log
rm -rf catalogue.zip
npm install &>>/temp/roboshop.log
echo -e "\e[31m creating catalogue service file \e[0m"
cp /root/practice-shell/catalogue.service /etc/systemd/system/catalogue.service &>>/temp/roboshop.log
systemctl daemon-reload
echo -e "\e[31m downloading and loading the mongodb schema \e[0m"
cp /root/practice-shell/mongo.repo /etc/yum.repos.d/mongodb.repo
yum install mongodb-org-shell -y &>>/temp/roboshop.log
mongo --host mongodb.ganta.cloud</app/schema/catalogue.js &>>/temp/roboshop.log
echo -e "\e[31m enabling and restarting the  catalogue service \e[0m"
systemctl enable catalogue &>>/temp/roboshop.log
systemctl restart catalogue
