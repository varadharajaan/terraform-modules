resource "aws_security_group" "alb" {
  name        = var.ALB_NAME
  vpc_id      = var.VPC_ID
  description = var.ALB_NAME

  ingress {
    from_port   = 0
    to_port     = 0
    protocol    = "-1"
    cidr_blocks = ["0.0.0.0/0"] // load balancer for application.  but anyhow traffic is restricted for 8080 in cluster security group
  }

  egress {
    from_port   = 0
    to_port     = 0
    protocol    = "-1"
    cidr_blocks = ["0.0.0.0/0"]
  }
}

resource "aws_security_group_rule" "cluster-allow-alb" {
  security_group_id        = var.ECS_SG
  type                     = "ingress"
  from_port                = 8080
  to_port                  = 8080
  protocol                 = "tcp"
  source_security_group_id = aws_security_group.alb.id
}

