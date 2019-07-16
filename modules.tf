module "zookeeper-cluster" {
  source      = "github.com/marvinlandicho/zookeeper-cluster-aws"
  name        = "zk"
  cnt         = 3
  subnet_ids  = "${module.zookeeper-subnets.subnet_ids}"
  subnet_cidr = "${module.zookeeper-subnets.subnet_cidr}"
  subnet_az   = "${module.zookeeper-subnets.subnet_az}"
  ami         = "ami-07f02e8be5da14095"
}

module "kafka-cluster" {
  source      = "github.com/marvinlandicho/kafka-cluster-aws"
  name        = "kf"
  cnt         = 3
  subnet_ids  = "${module.zookeeper-subnets.subnet_ids}"
  subnet_cidr = "${module.zookeeper-subnets.subnet_cidr}"
  subnet_az   = "${module.zookeeper-subnets.subnet_az}"
  ami         = "ami-041c154f9636c34ce"
}

module "zookeeper-subnets" {
  source      = "github.com/marvinlandicho/cluster-subnets-aws"
  name        = "broker-zookeeper-group"
  vpc_id      = "vpc-0d2fe90286b6e30ea"
  cidr_blocks = [
    "10.0.11.0/24",
    "10.0.12.0/24",
    "10.0.13.0/24"
  ]
}
