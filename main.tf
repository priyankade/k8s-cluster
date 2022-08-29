terraform {
  required_providers {
    rke = {
      source = "rancher/rke"
      version = "1.3.2"
    }
  }
}

# Configure RKE provider
provider "rke" {
  log_file = "rke_debug.log"
}



resource "rke_cluster" "cluster" {
  nodes {
    address = "**.***.**.**"
    node_name = "master"
    user    = "terraform"
    role    = ["controlplane", "worker", "etcd"]
    ssh_key_path = "/home/terraform/.ssh/" 
    ssh_key = file("/home/terraform/.ssh/id_rsa")
  }
  addons_include = [
    "https://raw.githubusercontent.com/kubernetes/dashboard/v1.10.1/src/deploy/recommended/kubernetes-dashboard.yaml",
    "https://gist.githubusercontent.com/superseb/499f2caa2637c404af41cfb7e5f4a938/raw/930841ac00653fdff8beca61dab9a20bb8983782/k8s-dashboard-user.yml",
  ]
  nodes {
   address = "node1"
   node_name = "node1"
   user    = "terraform"
   role    = ["worker"]
   ssh_key_path = "/home/terraform/.ssh/"
   ssh_key = file("/home/terraform/.ssh/id_rsa")
  }
  nodes {
   address = "node2"
   node_name = "node2"
   user    = "terraform"
   role    = ["worker"]
   ssh_key_path = "/home/terraform/.ssh/"
   ssh_key = file("/home/terraform/.ssh/id_rsa")
  }
  nodes {
   address = "node3"
   node_name = "node3"
   user    = "terraform"
   role    = ["worker"]
   ssh_key_path = "/home/terraform/.ssh/"
   ssh_key = file("/home/terraform/.ssh/id_rsa")
  }
  nodes {
   address = "node4"
   node_name = "node4"
   user    = "terraform"
   role    = ["worker"]
   ssh_key_path = "/home/terraform/.ssh/"
   ssh_key = file("/home/terraform/.ssh/id_rsa")
  }



}

resource "local_sensitive_file" "kube_cluster_yaml" {
  filename = "${path.root}/kube_config_cluster.yml"
  content  = "${rke_cluster.cluster.kube_config_yaml}"
  #content = "rke_cluster.cluster.kube_config_yaml"

  #depends_on = [rke_cluster.cluster]
}
