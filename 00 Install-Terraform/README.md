# Install Terraform on linux

Install unzip :
```console
$ sudo apt-get install unzip
```

Download terraform (change version if needed) :
```console
$ wget https://releases.hashicorp.com/terraform/0.12.13/terraform_0.12.13_linux_amd64.zip
```

Extract the archive :

```console
$ unzip terraform_0.12.13_linux_amd64.zip 
```

Move the executable in bin folder :

```console
$ sudo mv terraform /usr/local/bin/
```

Test your installation : 

```console
$ terraform --version
Terraform v0.12.13
```