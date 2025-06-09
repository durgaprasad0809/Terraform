# Create EC2 Instance using Terraform
# Create an Security Resource using Terraform
resource "aws_security_group" "allow_tls" {
  name        = "allow_tls"
  description = "Allow TLS inbound traffic"
  vpc_id      = "${aws_vpc.main.id}"

  ingress {
    description = "TLS from VPC"
    from_port   = 22 # SSH
    to_port     = 22 # SSH
    protocol    = "tcp" # TCP Protocal
    cidr_blocks = aws_vpc.main.cidr_block
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