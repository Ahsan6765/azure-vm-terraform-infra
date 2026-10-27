# Azure VM Terraform Infrastructure

Terraform provisions an Azure resource group, virtual network and subnets, a public IP,
network security group, network interface, and a Linux virtual machine.

## VM software

The VM is provisioned without a container runtime or Kubernetes distribution. RKE2 network
rules are prepared in the NSG for cluster traffic within the virtual network; they do not
install or configure an RKE2 cluster.

## RKE2 network rules

The NSG allows these inbound RKE2 ports from the Azure `VirtualNetwork` service tag only:

| Protocol | Port(s) | Purpose |
| --- | --- | --- |
| TCP | 9345 | RKE2 supervisor / node registration |
| TCP | 6443 | Kubernetes API |
| TCP | 2379–2380 | etcd peer and client traffic |
| TCP | 10250 | Kubelet |
| UDP | 8472 | Canal / Flannel VXLAN networking |

These rules are not exposed to arbitrary internet sources. If cluster administration from
outside the VNet is needed, add a separate narrowly-scoped rule for the required client IPs.
NodePort services (TCP/UDP 30000–32767) are not enabled by these rules; add them only if
the chosen workload and access design require them.

## SSH key

Set `ssh_public_key_path` in `terraform.tfvars` to the path of a public SSH key that exists
on the machine running Terraform.

