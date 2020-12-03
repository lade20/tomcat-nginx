provider "aws" {
  profile = "default"
  region  = "eu-west-1"
}

resource "aws_instance" "web-servers" {
  ami           = "ami-0ce1e3f77cd41957e"
  instance_type = "t2.micro"
  key_name      = "devop22"

  count     = "1"
  user_data = "${file ("script.tpl")}" // "${file("installapache.sh")}" 

  tags = {
    Name = "tomcat"
  }
}
output "ip_address" {
  value = "${aws_instance.web-servers.*.public_ip}"  
}

resource "aws_instance" "web-servers1" {
  ami           = "ami-0ce1e3f77cd41957e"
  instance_type = "t2.micro"
  key_name      = "devop22"

  count     = "1"
  user_data = "${file ("script1.tpl")}" // "${file("installapache.sh")}" 

  tags = {
    Name = "nginx"
  }
}