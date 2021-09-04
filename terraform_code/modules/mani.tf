module "sg" {
  source              = "./sg"
}

module "ec2" {
  depends_on          = [module.sg]
  source              = "./ec2"
  sg_details          = module.sg.SG_ID
  ami_id              = var.ami_id_robo
  components          = var.components
  Env                 = var.Env
}
####check