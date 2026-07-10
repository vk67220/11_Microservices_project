#resource "aws_security_group" "this" {
 # name   = "web-sg-${terraform.workspace}"
  #vpc_id = var.vpc_id

  #ingress {
    #description = "SSH"
    #from_port   = 22
    #to_port     = 22
    #protocol    = "tcp"
    #cidr_blocks = ["0.0.0.0/0"]
  #}

  #ingress {
    #description = "HTTP"
    #from_port   = 80
    #to_port     = 80
    #protocol    = "tcp"
    #cidr_blocks = ["0.0.0.0/0"]
  #}

  #ingress {
    #description = "jenkins"
    #from_port   = 8080
    #to_port     = 8080
    #protocol    = "tcp"
    #cidr_blocks = ["0.0.0.0/0"]
  #}

  #dynamic "ingress" {
   ##content {
     # description = "Port ${ingress.value}"
      #from_port   = ingress.value
      #to_port     = ingress.value
      #protocol    = "tcp"
      #cidr_blocks = ["0.0.0.0/0"]
    #}
  #}
  #egress {
   # description = "All"
   # from_port   = 0
   # to_port     = 0
    #protocol    = "-1"
    #cidr_blocks = ["0.0.0.0/0"]
  #}

  #tags = {
   # Name        = "web-sg-${terraform.workspace}"
    #Environment = terraform.workspace
  #}
#}

resource "aws_security_group" "this" {
  name   = "web-sg-${terraform.workspace}"
  vpc_id = var.vpc_id

  dynamic "ingress" {
    for_each = var.ports
    content {
      from_port   = ingress.value
      to_port     = ingress.value
      protocol    = "tcp"
      cidr_blocks = ["0.0.0.0/0"]
    }
  }

  egress {
    from_port   = 0
    to_port     = 0
    protocol    = "-1"
    cidr_blocks = ["0.0.0.0/0"]
  }
}