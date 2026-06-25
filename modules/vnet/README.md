<!-- BEGIN_TF_DOCS -->
## Requirements

No requirements.

## Providers

| Name | Version |
| ---- | ------- |
| <a name="provider_azurerm"></a> [azurerm](#provider\_azurerm) | 4.78.0 |

## Modules

No modules.

## Resources

| Name | Type |
| ---- | ---- |
| [azurerm_network_security_group.this](https://registry.terraform.io/providers/hashicorp/azurerm/latest/docs/resources/network_security_group) | resource |
| [azurerm_network_security_rule.this](https://registry.terraform.io/providers/hashicorp/azurerm/latest/docs/resources/network_security_rule) | resource |
| [azurerm_subnet.this](https://registry.terraform.io/providers/hashicorp/azurerm/latest/docs/resources/subnet) | resource |
| [azurerm_subnet_network_security_group_association.this](https://registry.terraform.io/providers/hashicorp/azurerm/latest/docs/resources/subnet_network_security_group_association) | resource |
| [azurerm_virtual_network.this](https://registry.terraform.io/providers/hashicorp/azurerm/latest/docs/resources/virtual_network) | resource |

## Inputs

| Name | Description | Type | Default | Required |
| ---- | ----------- | ---- | ------- | :------: |
| <a name="input_address_space"></a> [address\_space](#input\_address\_space) | Address space for the Virtual Network. | `list(string)` | n/a | yes |
| <a name="input_create_nsg"></a> [create\_nsg](#input\_create\_nsg) | Whether to create one Network Security Group for each subnet. | `bool` | `true` | no |
| <a name="input_location"></a> [location](#input\_location) | Azure region where the Virtual Network will be deployed. | `string` | n/a | yes |
| <a name="input_nsg_rules"></a> [nsg\_rules](#input\_nsg\_rules) | Custom NSG rules to apply to each Network Security Group. | <pre>list(object({<br/>    name                       = string<br/>    priority                   = number<br/>    direction                  = string<br/>    access                     = string<br/>    protocol                   = string<br/>    source_port_range          = string<br/>    destination_port_range     = string<br/>    source_address_prefix      = string<br/>    destination_address_prefix = string<br/>  }))</pre> | `[]` | no |
| <a name="input_resource_group_name"></a> [resource\_group\_name](#input\_resource\_group\_name) | The name of the Resource Group where the Virtual Network will be created. | `string` | n/a | yes |
| <a name="input_subnets"></a> [subnets](#input\_subnets) | Map of subnets to create.<br/><br/>Example:<br/><br/>subnets = {<br/>  app = {<br/>    address\_prefixes = ["10.0.1.0/24"]<br/>    service\_endpoints = ["Microsoft.Storage"]<br/>  }<br/><br/>  vm = {<br/>    address\_prefixes = ["10.0.2.0/24"]<br/>  }<br/>} | <pre>map(object({<br/><br/>    address_prefixes = list(string)<br/><br/>    service_endpoints = optional(list(string), [])<br/><br/>  }))</pre> | n/a | yes |
| <a name="input_tags"></a> [tags](#input\_tags) | Tags to apply to all Azure resources. | `map(string)` | `{}` | no |
| <a name="input_vnet_name"></a> [vnet\_name](#input\_vnet\_name) | The name of the Virtual Network. | `string` | n/a | yes |

## Outputs

| Name | Description |
| ---- | ----------- |
| <a name="output_nsg_ids"></a> [nsg\_ids](#output\_nsg\_ids) | Map of Network Security Group IDs. |
| <a name="output_subnet_ids"></a> [subnet\_ids](#output\_subnet\_ids) | Map of subnet IDs. |
| <a name="output_subnet_names"></a> [subnet\_names](#output\_subnet\_names) | Map of subnet names. |
| <a name="output_vnet_id"></a> [vnet\_id](#output\_vnet\_id) | The ID of the Virtual Network. |
| <a name="output_vnet_name"></a> [vnet\_name](#output\_vnet\_name) | The name of the Virtual Network. |
<!-- END_TF_DOCS -->