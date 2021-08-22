## How To Install Jenkins on AWS EC2

### Patch OS and yum packages
```bash
$ sudo yum update -y
$ sudo yum install git telnet -y
$ sudo amazon-linux-extras enable python3.8
$ sudo yum install python3.8
```

### Install Jenkins
```bash
# Download Jenkins source repo
$ wget -O /etc/yum.repos.d/jenkins.repo https://pkg.jenkins.io/redhat-stable/jenkins.repo

# Install Jenkins repo
$ rpm --import https://pkg.jenkins.io/redhat-stable/jenkins.io.key

# Install Jenkins
$ yum install jenkins java-1.8.0-openjdk-devel -y

# Start Jenkins process
$ systemctl daemon-reload
$ systemctl start jenkins
$ systemctl status jenkins
```

### Configure Jenkins
* Go to http://<ip>:8080
* Get initial admin password
* Install suggested plugins
* Create First admin user (admin/test1234)
* Update jenkins user shell to /bin/bash

### Generate ssh key pair for Github
```bash
$ ssh-keygen

```

### Create ubsdemo Python fastapi app
```bash
$ cd /Users/txu/code/ubs/devops101/module3/terraform/github
$ terraform plan
$ terraform apply
```

### Jenkins job configuration
```bash
# Create Python venv
python3.8 -m venv venv

# Initialize Python venv
source venv/bin/activate

# Upgrade pip
pip install -U pip

# Install required packages
pip install -r requirements.txt

# Run test
export PYTHONPATH="./app"
python -m unittest
```
