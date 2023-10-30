env            = "prod"
bastion_cidr   = ["172.31.47.177/32"]
default_vpc_id = "vpc-003b770dccb343ddb"

vpc = {
  main = {
    cidr_block        = "10.100.0.0/16"
    availability_zone = ["us-east-1a", "us-east-1b"]
    public_subnets = {
      public = {
        name        = "public"
        cidr_block  = ["10.100.0.0/24", "10.100.1.0/24"]
        internet_gw = true
      }
    }
    private_subnets = {
      web = {
        name       = "web"
        cidr_block = ["10.100.2.0/24", "10.100.3.0/24"]
        nat_gw     = true
      }
      app = {
        name       = "app"
        cidr_block = ["10.100.4.0/24", "10.100.5.0/24"]
        nat_gw     = true
      }
      db = {
        name       = "db"
        cidr_block = ["10.100.6.0/24", "10.100.7.0/24"]
        nat_gw     = true
      }
    }

  }
}