module "eks_cli_sg" {
  source = "terraform-aws-modules/security-group/aws"

  name        = "eks_cli_sg"
  description = "sg for eks cli"
  vpc_id      = module.my-vpc.vpc_id

  ingress_with_cidr_blocks = [
    {
      from_port   = 22
      to_port     = 22
      protocol    = "tcp"
      description = "ssh port"
      cidr_blocks = "0.0.0.0/0"
    }
  ]

  egress_with_cidr_blocks = [
    {
      from_port   = 0 
      to_port     = 0
      protocol    = "-1"
      description = "Allow all outbound traffic"
      cidr_blocks = "0.0.0.0/0"
    }
  ]
}

output "eks_cli_sg_security_group_id" {
  value = module.eks_cli_sg.security_group_id
}
