# Create EC2 Instance using Terraform
resource "aws_instance" "this" {  
  ami = "ami-09c813fb71547fc4f"
  vpc_security_group_ids =  [aws_security_group.allow_tls.id]
  instance_type = "t3.micro"
  tags = {
    Name = "terraform-demo" # name of the instances
  }
  
}
# Create an Security Resource using Terraform
resource "aws_security_group" "allow_tls" {
  name        = "allow_tls"
  description = "Allow TLS inbound traffic"
  
  ingress {
    description = "Allowing all"
    from_port   = 22 # SSH
    to_port     = 22 # SSH
    protocol    = "tcp" # TCP Protocal
    cidr_blocks = ["0.0.0.0/0"]
  }

  egress {
    from_port   = 0 #Allowing all IP addresses
    to_port     = 0 #Allowing all IP addresses
    protocol    = "-1" #Allowing all Proctocals
    cidr_blocks = ["0.0.0.0/0"]
  }

  tags = {
    Name = "allow_tls"
  }
}