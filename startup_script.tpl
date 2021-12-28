#! /bin/bash
sudo amazon-linux-extras install -y nginx1
sudo service nginx start
aws s3 sync s3://${s3_bucket_name}/website/ /home/ec2-user/
sudo rm /usr/share/nginx/html/index.html
sudo cp -r /home/ec2-user/resto/* /usr/share/nginx/html/