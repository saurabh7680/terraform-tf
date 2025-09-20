resource "aws_instance" "ec2_one" {
    tags = {
      Name = "ec2-terraform"
    }

    ami = var.ami_id
    instance_type = var.instance
    key_name = var.key_pair

    user_data = <<-EOF
    #!/bin/bash
    sudo -i
    sudo yum update 
    sudo yum install httpd -y
    sudo systemctl start httpd
    sudo systemctl enable httpd
    echo "Done with Terraform EC2" > /var/www/html/index.html
    EOF
}