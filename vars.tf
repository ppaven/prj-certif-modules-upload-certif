variable  certificate_name {}
variable  domain_name {}
variable  subscription_all {
  type = string
}
variable  resource_group_all {
  type = string
}
variable  resource_type_all {
  type = string
}
variable  resources_all {
  type = string
}
variable  endpoint_listener_all {
  type = string
  default = ""
}
variable  keyvault_all {
  type = string
  default = ""
}

variable aaa_subs_id {
}
variable aaa_rgp {
}
variable aaa_name {
}
variable runbook_name {
  default = "UploadCertToResources"
}
