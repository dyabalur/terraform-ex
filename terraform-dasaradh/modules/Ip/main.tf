# provider "curl" {
# //  client_id = "<client id of this app, registered in Azure AD>"
# //  resource = "https://vault.azure.net" //example of the scope/resource to call Azure KeyVault APIs
# //  tenant_id = "<azure tenant id>"
# //  secret = "" //taken from environment variable 'CURL_CLIENT_SECRET'
# }
terraform {
  required_providers {
    curl = {
      source  = "anschoewe/curl"
    }
  }
}

data "curl" "getTodos" {
  http_method = "GET"
  uri = "https://ifconfig.co/json"
}

locals {
  json_data = jsondecode(data.curl.getTodos.response)
}

