### Note
Please do the following on your EC2 instance.

### Install kubectl 1.21
```bash
$ pwd
/home/ec2-user
$ curl -o kubectl https://amazon-eks.s3.us-west-2.amazonaws.com/1.21.2/2021-07-05/bin/linux/amd64/kubectl
$ chmod +x ./kubectl
$ mkdir -p $HOME/bin && cp ./kubectl $HOME/bin/kubectl && export PATH=$PATH:$HOME/bin
$ kubectl version --short --client
Client Version: v1.21.2-13+d2965f0db
```

### Install eksctl
A simple command line utility for creating and managing Kubernetes clusters
on Amazon EKS. The eksctl command line utility provides the fastest and
easiest way to create a new cluster with nodes for Amazon EKS.

```bash
$ pwd
/home/ec2-user
$ curl --silent --location "https://github.com/weaveworks/eksctl/releases/latest/download/eksctl_$(uname -s)_amd64.tar.gz" | tar xz -C /tmp
$ sudo mv /tmp/eksctl /usr/local/bin
$ eksctl version
0.63.0
$ eksctl help
The official CLI for Amazon EKS

Usage: eksctl [command] [flags]

Commands:
  eksctl associate                       Associate resources with a cluster
  eksctl completion                      Generates shell completion scripts for bash, zsh or fish
  eksctl create                          Create resource(s)
  eksctl delete                          Delete resource(s)
  eksctl disassociate                    Disassociate resources from a cluster
  eksctl drain                           Drain resource(s)
  eksctl enable                          Enable features in a cluster
  eksctl get                             Get resource(s)
  eksctl help                            Help about any command
  eksctl info                            Output the version of eksctl, kubectl and OS info
  eksctl scale                           Scale resources(s)
  eksctl set                             Set values
  eksctl unset                           Unset values
  eksctl update                          Update resource(s)
  eksctl upgrade                         Upgrade resource(s)
  eksctl utils                           Various utils
  eksctl version                         Output the version of eksctl

Common flags:
  -C, --color string   toggle colorized logs (valid options: true, false, fabulous) (default "true")
  -h, --help           help for this command
  -v, --verbose int    set log level, use 0 to silence, 4 for debugging and 5 for debugging with AWS debug logging (default 3)

Use 'eksctl [command] --help' for more information about a command.
```

### Provisioning an EKS cluster
Use `eksctl` to create an EKS cluster.
```bash
# This command will take 10 - 15 mins
$ eksctl create cluster --name dev-cluster --version 1.21 --region us-east-1 --nodegroup-name standard-workers --node-type t3.micro --nodes 1 --nodes-min 1 --nodes-max 4 --managed
2021-08-29 18:45:43 [ℹ]  eksctl version 0.63.0
2021-08-29 18:45:43 [ℹ]  using region us-east-1
...
2021-08-29 19:06:00 [ℹ]  nodegroup "standard-workers" has 1 node(s)
2021-08-29 19:06:00 [ℹ]  node "ip-192-168-54-204.ec2.internal" is ready
2021-08-29 19:08:01 [ℹ]  kubectl command should work with "/home/ec2-user/.kube/config", try 'kubectl get nodes'
2021-08-29 19:08:01 [✔]  EKS cluster "dev-cluster" in "us-east-1" region is ready

$ eksctl get cluster
2021-08-29 19:09:17 [ℹ]  eksctl version 0.63.0
2021-08-29 19:09:17 [ℹ]  using region us-east-1
NAME		REGION		EKSCTL CREATED
dev-cluster	us-east-1	True

# To scale nodegroup from 1 node to 2
$ eksctl scale nodegroup --cluster dev-cluster standard-workers --nodes 2 --nodes-min 2 --nodes-max 4
```

### Configure kubectl
```bash
$ aws eks update-kubeconfig --name dev-cluster --region us-east-1
Added new context arn:aws:eks:us-east-1:357817309543:cluster/dev-cluster to /home/ec2-user/.kube/config

$ kubectl cluster-info
Kubernetes control plane is running at https://A7045A41B7435ABF81FCBE2C84D74E92.sk1.us-east-1.eks.amazonaws.com
CoreDNS is running at https://A7045A41B7435ABF81FCBE2C84D74E92.sk1.us-east-1.eks.amazonaws.com/api/v1/namespaces/kube-system/services/kube-dns:dns/proxy
```

### Delete K8S cluster
```bash
$ eksctl delete cluster --name dev-cluster
```
