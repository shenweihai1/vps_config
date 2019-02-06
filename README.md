## the configuration on the cloud machine
### install nginx
```
wget http://nginx.org/packages/centos/6/noarch/RPMS/nginx-release-centos-6-0.el6.ngx.noarch.rpm
rpm -ivh nginx-release-centos-6-0.el6.ngx.noarch.rpm
yum install nginx
```

### install python3.5
```
# Run the following command to install Software Collections Repository on CentOS
yum install centos-release-scl

yum info rh-python35

yum install rh-python35

# Run the below special scl command to enable the installed package version at the shell
scl enable rh-python35 bash

python --version

# Run the following command to get a list of SCL packages have been installed on system.
scl -l
```
