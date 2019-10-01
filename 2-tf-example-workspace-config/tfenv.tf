locals {
  tfdefaultsfile  = "tfenv-defaults.json"
  tfworkspacefile = "tfenv-${terraform.workspace}.json"

  tfenv = merge(
    jsondecode(file(local.tfdefaultsfile)),
    jsondecode(file(local.tfworkspacefile))
  )
}
