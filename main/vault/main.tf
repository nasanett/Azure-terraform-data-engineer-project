module "vault" {
  source            = "../../modules/vault-module/"
  key_vault_name    = "${var.key_vault_name}"
  resource_group_name = "${var.resource_group_name}"
  tenant_id         = "${var.tenant_id}"
  location          = "${var.location}"
}
