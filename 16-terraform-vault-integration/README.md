
# Terraform Vault Integration

In this demo i am going to intergarte a test vault server with terraform.  The main purpose of this demo is to use vault which is secret manager by Hashicorp to use with terraform to fetch secrets from it..


### Create a EC2 Instance 

We need to create an AWS EC2 instance using Ubuntu image with type t2.micro.

### Install Vault server ob that ec2 instance



#### 1. install gpg

`sudo apt update && sudo apt install gpg`
#### 2. Download the signing key to a new keyring

```
wget -O- https://apt.releases.hashicorp.com/gpg | sudo gpg --dearmor -o /usr/share/keyrings/hashicorp-archive-keyring.gpg 

```



#### 3. Verify the key's fingerprint

`gpg --no-default-keyring --keyring /usr/share/keyrings/hashicorp-archive-keyring.gpg --fingerprint`


#### 4. Add the HashiCorp repo

```
echo "deb [arch=$(dpkg --print-architecture) signed-by=/usr/share/keyrings/hashicorp-archive-keyring.gpg] https://apt.releases.hashicorp.com $(lsb_release -cs) main" | sudo tee /etc/apt/sources.list.d/hashicorp.list
```


#### 5. Finally, Install Vault

```
sudo apt update

sudo apt install vault
```


Start Vault Service with below Command in Terminal 1.

```
vault server -dev -dev-listen-address="0.0.0.0:8200"
```

## Integrate Terraform with Vault to read the secrets .


Detailed steps to enable and configure AppRole authentication in HashiCorp Vault:

#### 1. First we need to enable AppRole Authentication using Vault CLI:
  In Terminal 2 export the vault address which you get in Terminal 1 and then run below command to enable the approle authentication


`vault auth enable approle`



#### 2. Create an AppRole Policy:

```
vault policy write terraform - <<EOF
path "*" {
  capabilities = ["list", "read"]
}

path "secrets/data/*" {
  capabilities = ["create", "read", "update", "delete", "list"]
}

path "kv/data/*" {
  capabilities = ["create", "read", "update", "delete", "list"]
}


path "secret/data/*" {
  capabilities = ["create", "read", "update", "delete", "list"]
}

path "auth/token/create" {
capabilities = ["create", "read", "update", "list"]
}
EOF

```


#### 3. Create the AppRole:

```
vault write auth/approle/role/terraform \
    secret_id_ttl=10m \
    token_num_uses=10 \
    token_ttl=20m \
    token_max_ttl=30m \
    secret_id_num_uses=40 \
    token_policies=terraform

```

###  Generate Role ID and Secret ID which we need to use in provider section in terraform by using the role id and secret terraform can integrate with vault:



#### 1. Generate Role ID use this as parameters in vault provider:



`vault read auth/approle/role/terraform/role-id`

Save the Role ID for use in your Terraform configuration.


#### 2. Generate Secret ID and use this as parameters in vault provider:


`vault write -f auth/approle/role/terraform/secret-id`

Save the secret Id


