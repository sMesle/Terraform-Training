# Install Terraform on linux

Install unzip :
```
$ sudo apt-get install unzip
```

Download terraform (change version if needed) :
```
$ wget https://releases.hashicorp.com/terraform/0.12.13/terraform_0.12.13_linux_amd64.zip
```

Extract the archive :

```
$ unzip terraform_0.12.13_linux_amd64.zip 
```

Move the executable in bin folder :

```
$ sudo mv terraform /usr/local/bin/
```

Test your installation : 

```
$ terraform --version
Terraform v0.12.13
```