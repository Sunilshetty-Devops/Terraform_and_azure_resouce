# Create resource group
resource "azurerm_resource_group" "rg" {
  name     = "sunil_rg"
  location = "northcentrelus"
}

# Create DNS zone
resource "azurerm_dns_zone" "dns_zone" {
  name                = "dns_zone"
  resource_group_name = azurerm_resource_group.rg.name
}

# Create DNS A record
resource "azurerm_dns_a_record" "dns_a_r" {
  name                = "dns_a_r"
  resource_group_name = azurerm_resource_group.rg.name
  zone_name           = azurerm_dns_zone.dns_zone.name
  ttl                 = 300
  records             = ["10.0.0.1"]
}

# Create DNS CNAME record
resource "azurerm_dns_cname_record" "dns_cn_r" {
  name                = "www"
  resource_group_name = azurerm_resource_group.rg.name
  zone_name           = azurerm_dns_zone.dns_zone.name
  ttl                 = 300
  record             = "abc.xyz.com"
}

# Create DNS MX record
resource "azurerm_dns_mx_record" "dns_mx_r" {
  name                = "dns_mx_r"
  resource_group_name = azurerm_resource_group.rg.name
  zone_name           = azurerm_dns_zone.dns_zone.name
  ttl                 = 300
  records             = [
    {
      preference = 10
      exchange   = "mail.example.com"
    }
  ]
}

