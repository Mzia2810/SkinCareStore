resource "aws_instance" "web" {
  ami                    = "ami-0f5ee92e2d63afc18"
  instance_type          = "t2.micro"
  subnet_id              = data.aws_subnet.public.id

  vpc_security_group_ids = ["sg-0ee7171f9f319c0e9"]

  associate_public_ip_address = true

  user_data = <<-EOF
              #!/bin/bash
              yum update -y
              yum install -y httpd
              systemctl start httpd
              systemctl enable httpd

              echo "<h1>🚀 SkinCare Terraform LIVE</h1>" > /var/www/html/index.html
              EOF

  tags = {
    Name = "SkinCare-Web-Server"
  }
}