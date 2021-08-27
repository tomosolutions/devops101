### Add user to Docker group
```bash
$ usermod -a -G docker ec2-user
```

### To Build a local image
```bash
# Go into the folder that contains a Dockerfile
$ cd docker
$ ls
Dockerfile  file1  file2.tar.gz
$ docker build -t registry/httpd:v1 -f ./Dockerfile .
Sending build context to Docker daemon  3.584kB
Step 1/6 : FROM centos:8.1.1911
 ---> 470671670cac
Step 2/6 : RUN yum install -y httpd
 ---> Using cache
 ---> 44475f9c4305
Step 3/6 : COPY file1 /var/www/html/
 ---> Using cache
 ---> 6e4d4a3160fb
Step 4/6 : ADD  file2.tar.gz /var/www/html/
 ---> Using cache
 ---> 11815b10afdf
Step 5/6 : CMD ["/sbin/httpd", "-D", "FOREGROUND"]
 ---> Using cache
 ---> 52dc41ebf734
Step 6/6 : EXPOSE 80
 ---> Using cache
 ---> 01fb7dd11835
Successfully built 01fb7dd11835
Successfully tagged registry/httpd:v1
$ docker images registry/httpd
REPOSITORY       TAG       IMAGE ID       CREATED       SIZE
registry/httpd   v1        01fb7dd11835   6 hours ago   287MB
```



### To Build a docekrhub image
```bash
# Create a repository in docker hub
# Go into the folder that contains a Dockerfile
$ cd docker
$ ls
Dockerfile  file1  file2.tar.gz
$ docker build -t tonylixu/httpd:v1 -f ./Dockerfile .
Sending build context to Docker daemon  3.584kB
Step 1/6 : FROM centos:8.1.1911
 ---> 470671670cac
Step 2/6 : RUN yum install -y httpd
 ---> Using cache
 ---> 44475f9c4305
Step 3/6 : COPY file1 /var/www/html/
 ---> Using cache
 ---> 6e4d4a3160fb
Step 4/6 : ADD  file2.tar.gz /var/www/html/
 ---> Using cache
 ---> 11815b10afdf
Step 5/6 : CMD ["/sbin/httpd", "-D", "FOREGROUND"]
 ---> Using cache
 ---> 52dc41ebf734
Step 6/6 : EXPOSE 80
 ---> Using cache
 ---> 01fb7dd11835
Successfully built 01fb7dd11835
Successfully tagged registry/httpd:v1
$ docker images registry/httpd
REPOSITORY       TAG       IMAGE ID       CREATED       SIZE
registry/httpd   v1        01fb7dd11835   6 hours ago   287MB

$ docker push tonylixu/httpd:v1
The push refers to repository [docker.io/tonylixu/httpd]
f9b52acc6425: Pushed
ceda336d435d: Pushed
cba84bafc6c9: Pushed
0683de282177: Mounted from library/centos
v1: digest: sha256:8a81e5e4ae0e07329257a05b1387ec74c13ce934599cdb0aeaea1e26b2d51e5c size: 1155
```









