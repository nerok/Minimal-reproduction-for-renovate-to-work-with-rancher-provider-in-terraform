terraform {
  required_version = ">1.0"

  required_providers {
    rancher2 = {
      source  = "rancher/rancher2"
      version = "1.25.0"
    }
  }
}

data "rancher2_cluster" "cluster" {
  name = "cluster1"
}

resource "rancher2_catalog_v2" "kured" {
  cluster_id = data.rancher2_cluster.cluster.id
  name       = "kured"
  url        = "https://kubereboot.github.io/charts"
}

resource "rancher2_app_v2" "kured" {
  cluster_id    = data.rancher2_cluster.cluster.id
  name          = "kured"
  namespace     = "kube-system"
  repo_name     = rancher2_catalog_v2.kured.name
  chart_name    = "kured"
  chart_version = "4.1.0"
}
