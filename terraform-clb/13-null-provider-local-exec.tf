# Create a Null Resource and Provisioners
resource "null_resource" "test-null" {
  depends_on = [module.ec2-bastion-host]
  # Connection Block for Provisioners to connect to EC2 Instance
  connection {
    type     = "ssh"
    host     = module.ec2-bastion-host.public_ip    
    user     = "ec2-user"
    password = ""
    private_key = file("private_key/terraform-key.pem")
  }  

## File Provisioner: Copies the terraform-key.pem file to /tmp/terraform-key.pem
  provisioner "file" {
    source      = "private_key/terraform-key.pem"
    destination = "/tmp/terraform-key.pem"
  }
## Remote Exec Provisioner: Using remote-exec provisioner providing required permissions to key
  provisioner "remote-exec" {
    inline = [
      "sudo chmod 400 /tmp/terraform-key.pem"
    ]
  }
  
}

