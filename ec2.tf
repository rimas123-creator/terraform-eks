module "ec2-instance" {
  source  = "terraform-aws-modules/ec2-instance/aws"
  version = "5.6.0"
  ami            = var.ami
  instance_type  = "t3.micro"
  key_name       = var.key_name
  subnet_id      = element(module.my-vpc.public_subnets, 0)

  vpc_security_group_ids = [module.eks_cli_sg.security_group_id]
  associate_public_ip_address = true
  iam_instance_profile = var.iam_instance_role_eks

  user_data       = "${file("install_ekscli.sh")}"

  tags = {
    Name        = "eks-cli"
    Terraform   = "true"
    Environment = "dev"
  }
}

output "eks_cli_instance_ip" {
    value = module.ec2-instance.public_ip
}
