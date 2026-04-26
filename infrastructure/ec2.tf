resource "aws_instance" "web" {
  ami           = "ami-0f5ee92e2d63afc18"  # Amazon Linux 2 (ap-south-1)
  instance_type = "t2.micro"

  subnet_id              = data.aws_subnet.selected.id
  vpc_security_group_ids = [var.sg_id]

  associate_public_ip_address = true

  # Ensure instance is fully ready before provisioning completes
  user_data_replace_on_change = true

  user_data = <<-EOF
              #!/bin/bash
              set -e

              yum update -y
              yum install -y httpd

              systemctl enable httpd
              systemctl start httpd

              echo "<html>
              <head><title>SkinCare App</title></head>
              <body style='text-align:center;font-family:Arial'>
              <h1>🚀 SkinCare Terraform Deployment SUCCESS</h1>
              <p>Server is running on AWS EC2</p>
              </body>
              </html>" > /var/www/html/index.html
              EOF

  tags = {
    Name        = "SkinCare-Web-Server"
    Environment = "dev"
    ManagedBy   = "terraform"
  }
}