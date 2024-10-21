
resource "random_string" "suffix" {
  length  = 5
  upper   = true
  lower   = true
  numeric = true
  special = false
}

locals {
  webhook_name = "${var.aaa_name}_wh_${random_string.suffix.result}"
  expiry_time = timeadd(timestamp(),"24h")
}


####
# Creation du Webhook

resource "azurerm_automation_webhook" "webhook_uploadcert" {
  name                    = local.webhook_name
  resource_group_name     = var.aaa_rgp
  automation_account_name = var.aaa_name
  expiry_time             = local.expiry_time
  enabled                 = true
  runbook_name            = var.runbook_name
  # uri                     = local.webhook_uri

  parameters = {
    CertificateName     = var.certificate_name
    DomainName          = var.domain_name
    SubscriptionNameAll    = var.subscription_all
    ResourceGroupAll       = var.resource_group_all
    ResourceTypeAll        = var.resource_type_all
    ResourcesAll           = var.resources_all
    EndPoint_ListenerAll   = var.endpoint_listener_all
    KeyVaultAll            = var.keyvault_all
  }

  lifecycle {ignore_changes = [expiry_time]}
}

####
# Appel du Webhook
resource "null_resource" "exec_webhook" {
  provisioner "local-exec" {
    command = "curl -X POST ${azurerm_automation_webhook.webhook_uploadcert.uri} --header \"content-type: application/json\" -d \"\" && sleep 30"
  }

  depends_on = [azurerm_automation_webhook.webhook_uploadcert]
}

