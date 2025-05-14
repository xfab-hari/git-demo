module "iam" {
  source = "./modules/iam"
}

module "network" {
  source = "./modules/network"
}

module "alb" {
  source = "./modules/alb"
  vpc_id     = module.network.vpc_id
  subnet_ids = module.network.subnet_ids
  webserver1_id = module.ec2.webserver1_id
  webserver2_id = module.ec2.webserver2_id
}

module "ec2" {
  source = "./modules/ec2"
  vpc_id              = module.network.vpc_id
  subnet1_id          = module.network.subnet1_id
  subnet2_id          = module.network.subnet2_id
  nw_interface1       = module.network.nw_interface1
  nw_interface2       = module.network.nw_interface2
  iam_instance_profile = module.iam.instance_profile_name
}