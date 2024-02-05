# providers aws and vault 
provider "aws" {
   region = "us-east-1"

}

provider "vault" {
  address = "http://44.192.116.1:8200"
  skip_child_token = true

  auth_login {
    path = "auth/approle/login"

    parameters = {
      role_id = var.vault_token       #"6ac7a6bc-9ba4-465c-4674-d3b3b55cbb9c"
      secret_id = var.vault_secret_id  #"cf4ed1b9-2b74-e984-739d-b8c450ff6d67"
    }
  }
}


# data block to get the secret value from vault
data "vault_kv_secret_v2" "vault_data" {
  mount = "secret"
  name = "jasmeet-secret"
}

resource "aws_instance" "ec2_test" {
  ami = "ami-0c7217cdde317cfec"
  instance_type = "t2.micro"
  subnet_id = "subnet-0fe113f42e77896a6"
  tags = {
    Name = "vault-integration-test"
    secret = data.vault_kv_secret_v2.vault_data.data["username"]
  }
}

