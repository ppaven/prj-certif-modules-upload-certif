# Upload-certif terraform module
# Create and execute a webhook which call the Runbook "UploadCertToResources".

[![pipeline status]]

## description

Module to upload a cretificate from central keyvault to the resource or in a local keyvault.

## vars

- Required:
  - **aaa_subs_id** => Subscription ID of Automation Account
  - **aaa_rgp** => Resource group name of Automation Account
  - **aaa_name** => Automation Account name
  - **certificate_name** => Name of the certificate to upload to resources 
  - **domain_name** => Domain name
  - **subscription_all** => List of  Subscription name the resources
  - **resource_group_all** => List of Resource-group name of resources
  - **resource_type_all** => List of Resource type of resources (AppService, API, AGW, VM, VMG)
  - **resources_all** => List of resources separate by a comma
  
- Optional:
  - **endpoint_listener_all** => API : Endpoint name. AGW : listener name
  - **keyvault_all** => List of local keyvault to store the certificate  

- 
## outputs


## usage

```
module "uploadcertif" {
  source              = "../modules/upload-certif/"

  aaa_subs_id         = "AZC-SUB-HUB"
  aaa_rgp             = "AZC-POC-RG-CERT"
  aaa_name            = "azc-poc-cert-aaa"
  certificate_name    = "test-azcloud-consulting-com"
  domain_name         = "test.azcloud-consulting.com"
  subscription        = "AZC-SUB-POC"
  subscription_all    = "AZCP-RG-TST"
  resource_type_all   = "AppService"
  resources_all       = "azcptestapp001"

}
```
