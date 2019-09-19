# Demo Terraform

## contents

Demo Terraform 1.12 state management

## Requirements

Digital Ocean config: I have a file ~/DigitalOcean/tf_env with the following contents:
```
SSH_FINGERPRINT=$(ssh-keygen -lE md5 -f ~/.ssh/id_rsa.do.pub | awk '{print $2}')

TF_VAR_do_token=$(cat /home/herve/Documents/do/generic_do_token.pat)
TF_VAR_ssh_fingerprint=${SSH_FINGERPRINT#MD5:}
TF_VAR_pub_key=/home/herve/.ssh/id_rsa.do.pub
TF_VAR_pvt_key=/home/herve/.ssh/id_rsa.do

export TF_VAR_do_token TF_VAR_ssh_fingerprint TF_VAR_pub_key TF_VAR_pvt_key
```

It requires:
- ~/DigitalOcean/do_token.pat - your DigitalOcean token
- ~/.ssh/id_rsa.do and ~/.ssh/id_rsa.do.pub, an SSH key pair to access your droplets. Warning: priv key must not be password-protected.

On top of that, you need the `terraform` binary in your path.

## Run example

```
. ~/DigitalOcean/tf_env

cd tf-example
terraform init
terraform plan
```
