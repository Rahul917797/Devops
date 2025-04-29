sudo apt update -y && sudo apt install wget zip unzip curl git -y
echo "Creating Kubernetes cluster..."
sleep 3
echo "====================================="
echo "Installing aws-cli version..."
sleep 2
curl "https://awscli.amazonaws.com/awscli-exe-linux-x86_64.zip" -o "awscliv2.zip"
sudo unzip awscliv2.zip  
sudo ./aws/install
echo "Checking aws version"
aws --version
echo "====================================="
echo "Installing eksctl version"
sleep 2
curl --silent --location "https://github.com/weaveworks/eksctl/releases/latest/download/eksctl_$(uname -s)_amd64.tar.gz" | tar xz -C /tmp
sudo mv /tmp/eksctl /usr/local/bin
eksctl version
echo "====================================="
echo "Installing kubectl version"
sleep 2
sudo curl --silent --location -o /usr/local/bin/kubectl https://s3.us-west-2.amazonaws.com/amazon-eks/1.22.6/2022-03-09/bin/linux/amd64/kubectl
sudo chmod +x /usr/local/bin/kubectl
kubectl version --short --client
echo "====================================="
echo "====================================="
echo "Launching Kubernetes cluster with two nodes..."
eksctl create cluster --name Rahul --region us-east-1 --nodegroup-name my-nodes --node-type t3.small --managed --nodes 2
sleep 2
echo "Cluster is created successfully........ :):):)"
echo "***********************************************"

# Then create IAM user and add secret key, Access key, add region and data type then it is done
