# Minimal reproduction for renovate to work with rancher provider in terraform
Minimal reproduction for issue: https://github.com/renovatebot/renovate/issues/10246

# Current behavior
Renovate only discovers the Terraform provider.

# Expected behavior
Renovate discovers the new versjon of Kureds helmchart from the rancher2_catalog_v2 and rancher2_app_v2 resources.