# Installation steps and/or notes for k3s
## Note: Turn off swap, zram etc.
1. Install k3s on master node:\
  `curl -sfL https://get.k3s.io | K3S_KUBECONFIG_MODE="644" sh -s -`
2. Get your node-token from master node:\
  `cat /var/lib/rancher/k3s/server/node-token`
3. Run on worker nodes with local ip of master node, your node-token and your desired host name for the worker node:\
  `curl -sfL https://get.k3s.io | K3S_URL=https://myserver:6443 K3S_TOKEN=mynodetoken K3S_NODE_NAME="nodename" sh -`


## Relevant Links:
[Network Chuck's tutorial on yt](https://www.youtube.com/watch?v=X9fSMGkjtug)  
[Explanation of `K3S_KUBECONFIG_MODE` var in 1st command](https://github.com/k3s-io/k3s/issues/389)  
[K3S Documentation](https://rancher.com/docs/k3s/latest/en/)  
[K3S Official Website](https://k3s.io/)  