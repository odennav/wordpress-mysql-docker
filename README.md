# Deploy the Wordpress website with Mysql DB

Automate launch of installation page for `Wordpress` and `Mysql` with bash scripts in a Test environment.


## Getting Started


Install [Terraform](https://developer.hashicorp.com/terraform/install) in your local machine

Install [AWS CLI](https://docs.aws.amazon.com/cli/latest/userguide/getting-started-install.html) in your local machine

```bash
sudo apt install curl unzip
curl "https://awscli.amazonaws.com/awscli-exe-linux-x86_64.zip" -o "awscliv2.zip"
unzip awscliv2.zip
sudo ./aws/install -i /usr/local/aws-cli -b /usr/local/bin
```

Confirm the AWS CLI installation
```bash
aws --version
```

Clone this repository in your local machine
```bash
cd /
git clone git@github.com:odennav/wordpress-mysql-docker.git
```

Execute these Terraform commands sequentially in your local machine to create the AWS VPC(Virtual Private Cloud) and EC2 instances.

Initializes terraform working directory
```bash
cd wordpress-mysql-docker/terraform
terraform init
```

Validate the syntax of the terraform configuration files
```bash
terraform validate
```

Create an execution plan that describes the changes terraform will make to the infrastructure
```bash
terraform plan
```

Apply the changes described in execution plan
```bash
terraform apply -auto-approve
```

Check AWS console for instances created and running

**SSH access**

Use `.pem` key from AWS to SSH into the public EC2 instance. IPv4 address of public EC2 instance will be shown in terraform outputs.
```bash
ssh -i private-key/terraform-key.pem ec2-user@<ipaddress>
```
   
Clone this repository to the `docker build` machine provisioned and install git in VM.

```bash
sudo apt-get install git
git clone https://github.com/odennav/wordpress-myswl-docker.git
cd docker-card-site
```

Download HTML template from `Tooplate` and extract webfiles to working directory
```bash
cd bash-scripts/
bash get_html.sh
```
Run script to stand up the docker containers
```bash
cd bash-scripts/
bash docker-compose-deploy.sh
```

-----
Check your Dockerhub repository to confirm docker images were uploaded

![](https://github.com/odennav/wordpress-docker-compose/blob/master/docs/dockerhub%20desktop.jpeg)

-----
Open Wordpress setup page on web browser with url `localhost:8000`

![](https://github.com/odennav/wordpress-docker-compose/blob/master/docs/wordpress_setup_page.jpeg)

-----

### Clean Up Deployment(Optional)

Delete docker images and containers used to host the website
```bash
cd bash-scripts/
bash clean_up.sh 
```
-----

Enjoy!
