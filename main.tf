provider "aws" {
region = "ap-south-1"
access_key = "AKIA6ODU56BRIRATSMU6"
secret_key = "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"
}

resource "aws_instance" "one" {
ami = "ami-0e670eb768a5fc3d4"
instance_type = "t2.medium"
   key_name = "terra-key"
   vpc_security_group_ids = [aws_security_group.three.id]
   availability_zone = "ap-south-1a"
   user_data = <<EOF
#!/bin/bash
sudo yum update -y
sudo yum install httpd -y
sudo systemctl start httpd 
sudo chkconfig httpd on
sudo echo "Hi Good Afternoon All This is My Zomato-1 Web-Application Created by Java Home Cloud Server-1" > /var/www/html/index.html
EOF
tags = {
Name = "Zomato-1"

 } 
}

resource "aws_instance" "two" {
ami = "ami-0187337106779cdf8"
instance_type = "t2.medium"
   key_name = "terra-key"
   vpc_security_group_ids = [aws_security_group.three.id]
   availability_zone = "ap-south-1b"
   user_data = <<EOF
#!/bin/bash
sudo yum update -y
sudo yum install httpd -y
sudo systemctl start httpd
sudo chkconfig httpd on
sudo echo "Hi Good Afternoon All This is My Zomato-2 Web-Application Created by Java Home Cloud Server-2" > /var/www/html/index.html
EOF
tags = {
Name = "Zomato-2"
 }
}

