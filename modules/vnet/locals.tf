locals {
  tags = var.tags
  expanded_nsg_rules = {

    for rule in flatten([

      for subnet_name, subnet in var.subnets : [

        for nsg_rule in var.nsg_rules : {

          key = "${subnet_name}-${nsg_rule.name}"

          subnet = subnet_name

          rule = nsg_rule

        }

      ]

    ]) :

    rule.key => rule

  }

}