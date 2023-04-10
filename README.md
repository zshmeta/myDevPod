# myDevPod
  #### <em> by zshmeta... </em>
 ## Get a Pod together fully equipped for Web Dev & Deploy
  #### This work is an idea i had after looking into pods and containered work environments as well as the benefit of the many benefits of using containers and why i should get familiar with handling them.
###### i will try to be as explicit as possible while keeping "sujet-verbe-complement" in mind.

## Intro

1. What is a Container
###### Even less excuse to not get familiar with them
2. What are Pods
###### Because from one, came many
3. What tools and tech i am using
###### Because "Tous les chemins mènent à Rome"
4. How I am doing it
###### There's only ever going to be one way "it's been done"


### What is a Container

What we call a container (or commonly a docker "image/container") is a virtual isolated environment that would run specifically what is needed, without affecting or being affected by the runing system. Containers are used to run images which can be fully working OS's or simply a static application. In both cases their lightness and isolation make them a great tool to use, especially when it comes to development.
Let's see:
 1. Isolation from the host system - no dependencies issues or  package conflicts.

 2. organisation of the system - no need to worry about system location or file structure
 3. lightness - a container barely takes more space than what it contains
4. portability - a container can be moved from one system to another without any issue
5. versioning - a container can be versioned and rolled back to a previous version if needed





### What are Pods

A pod is a set of containers that are assembled together to form a working environment. A pod is made of containers that are each isolated from the host system but that, through routing, communicates with each others thus creating exactly the wnvironment we need without bloats or unnecessary presets. This allows for a more efficient use of resources and a more saturated environment which can save an extensive amount of time to developers.
Some names to remember here and other subjects to look into are Kubernetes, OpenShift, Clusters, Docker Swarm, etc. These are all tools that are used to manage pods in volumes like would a proper production operation. I am currently getting familiar with Openshift, the RHEL version of Kubernetes, but that is a matter for another time.

### What tools and tech i am using

You most likely have heard about docker, easily the most popular tool for containerisation. Docker (and it's many products) have taken the monopoly on containerisation so much that we call an image file a docker image, and often refered to pods as docker-compose. but that doesn't mean that docker is the only tool available. for example i use podman, a tool made by RedHat that is a drop in replacement for docker. It is a great tool that is not as popular as docker but that is just as good and even better in my situation in the sense that it allows more freedom on chosing how and where it runs. It is also a great tool to use if you intend to move, share or deploy your project as it is advantageous in it's abilities to be easily portable and manageable from the outside
#### Here comes the Pod.

Only 2 ways i have found to do things here:

Either use the official podman-desktop wich is provided by podman and it is a very intuitive gui that allows you to manage your pod and it's containers. I

Or the way it has and always will work, which is to use the command line. I will be using the command line as it is the most efficient way to do things and it is the way i am most familiar with. I will be using the podman-compose tool to manage my pod. It is a tool that allows you to manage your pod through a compose file. Note that i also host my own images on Docker hub wich makes it easier to pull images (otherwise if using public images i suggest docker-compose for the initial setup or to pull the images locally first and then use podman-compose to build and manage your pod)

#### How I am doing it

Podman is definitely what i suggest as it is the tool I am using. Made by RedHat,  it is a powerful toll that benefits from a real enterprise grade care and development.  Many other brilliant tools exists such as linux native LXD or other lesser known tools like buildah.
I will be using podman-compose to manage my pod. It is a tool that allows you build, monitor and manage your pod.
i have also Podman Desktop available as an gui in cas i need it.

## My Pick of Components

### 1. Core Components

This project is inspired and built on the original idea of the "devilbox" and so our structure will be very similar.
Her are the core components of the pod:

```yaml

version: '3.7'

##Please view ../docker-compose ##
#### available at docker.io/zshmeta ####

podbind
php-fpm-8.1
apache 2.4 || nginx
mysql 8.0 || mariadb 10.10
postgres
redis
mongodb
supervisord
phpmyadmin
phpmyredmin
nodejs

```



### 1. Web development STACKs


Only 3 things really are essential for building a CRUD app and they are what we will be looking into here:


#### 1. Front

The frontend is the part of the app that the user will interact with. It is the part that will be displayed on the screen. html and css are responsible for this part although in a php project such as ours, php is also essential to the frontend.
Note: nodejs is also a way to communicate with the server if our app is js based. Unless using REACT or ANGULAR, nodejs is not needed to display the frontend.

#### 2. Back

The backend is the part of the app that will handle the data and most functions of our app. It is the part that will be in charge of the database and the logic of the app.PHP, JS and SQL are the only languages available for the backend of this pod. Unless we specifically wanted to run our functions on the frontend, we now can have the real magic happening in the back while offering a pleasant ui in the front

#### 3. "La Terre du Milieu"

You'll often hear about FrontEnd and Backend amongst developers and perhaps even fullStack....
But what about the middle? The middle is where the logic we have created through our code will allow the frontend and the backend to communicate. It is essential in order to have the frontend and backend handle data fluently and efficiently to consider and optimize this part of our pod the communication between the two. This is where the magic happens.


### 2. Database

For the database we will be using the following:

```yaml
version: '3.7'

##Please view ../docker-compose ##
#### available at docker.io/zshmeta ####

mysql:mariadb-8.0
mysql:mysql-8.0

postgres:latest # (from official hub)
redis:latest # (from official hub)
mongodb:latest # (from official hub)
```

### 4. Server Environment

In order to create a classic server environment, we will deploy a server locally that would emulate a real-life-situation making our web app available under a domain name, this is as close as it gets to a fully deployed app
i will be using apache as it is what is used the most but both are nginx and apache are available. see INSTALL.md.

### 5. Test Deployment

For this, One tool makes it a breeze and you most likeely have heard of it. It is called "ngrok" and it is a tool that allows you to expose your local server to the internet. when set properly and along the other tools present, this is considered a "Rendu Final" as your final product will supposedly be exactly the way it shows up on the internet when using ngrok.

### 6. Other Tools

As is the pod should sustain a full stack web app, we should be then able to manage our database as well as monitor our server and it's health as if it was in production.

For database management tools like phpmyadmin, postgresadmin, phpmyredmin etc. are available and for monitoring our stack, have included tools like supervisord, memcached as well as watcherp for networking. Finally, the dynamic creation of virtual hosts using vhost-gen allows a comprehensible and clear setup and therefore efficient development and deployment.

## Firing up the pod

see INSTALL.md

### Pre-Boot

see INSTALL.md

Make sure to have your projects in a single folder under


./devpod/data/www/myproject/htdocs/*INDEX_OF_MYPROJECT*

see INSTALL.md

Assuming our pod is running and that  the requirements are met, we can start a shell session inside our pod  as a user, run a script "script.sh" with the  following commands in it:
Note (if you used docker all along you might need to sudo here but you will still end up in a user shell in the pod)

sh ./shell.sh

```bash
#!/bin/sh

if hash docker-compose 2>/dev/null; then
	docker-compose exec --user devpod php bash -l
else
	docker compose exec --user devpod php bash -l
fi
```

Once in the pod as a user simply run sudo... to run commands in root mode.
<i>find the above script in the repo.</i>

#### Compose

some general "reminders":

1. To start the pod up you need to be within the devpod directory where the docker-compose.yml file is located. Run "pwd" to verify.
see INSTALL.md


2. When "composing" our pod, we need to bind host's UID/GUID  with the container's UID/GUID, meaning all file and other permissions as well as most user related settings will be mirrored to each other.


3. Similarly, ports will be mapped to match <small><i>(except for port 80 mapped as 80:8080)</i></small> so bear in mind that the relevant ports need to be available on the host machine.


4. Environments and other key settings are specific to each of the instances you launch. Each instance is completely independent from the host's or any other pods running . This allows us to run different projects using different technologies all whilst on the same desktop, Another common use case is being able to work using different versions of the same tool e.g: different version of PHP or different db used...


### Booting up the pod

##### Checklist

1. Make sure you have docker and docker-compose and/or podman and podman-compose installed . Note that podman would also work with docker-compose so you could have podman for runing your pod and docker-compose to build it. This will make it easier and much more stable to pull and compose images from dockerhub. Alternatively, you could first pull and build images using "podman pull" and by specifying the repo.
```code
podman pull docker.io/zshmeta/
```

2. Make sure you grab a copy of the source code of myDevPod in case you wanted to tweak it and have a customized ready to go version. If you don't have one, you can clone the repo from github. Keep a clean un-built copy of myDevPod to run fresh pods on the go.
```code
git clone https://github.com/zshmeta/myDevPod.git
```

3. Make sure you read and make a copy of the env-file to save as /.env  in myDevPod directory along with compose file. You can do so by running the following command:
```bash
cd /path/to/myDevPod
cp env-file .env
{nano,vi,vim} .env
 ```

##### Take the time to read the .env file and make sure you set the relevant settings. You can also tweak the settings to your liking. The settings are pretty self explanatory.
 in the myDevPod directory.

4. Make sure you have a copy of the shell.sh file in the myDevPod directory. If you don't have one, just create one or grab a fresh copy of the repo.


##### Ready, Now Set and Launch the pod

Some settings are essential to run the pod as intended. Other than the ones mentioned here, you may have to set some other settings depending on your needs.

First let's check the current's user UID and GID. To do so, run the following command:

```bash
id -u
id -g
```

The output should be something like this:

```bash
1000
1000
```
it could be different depending on your system.

Now let's set the UID and GID in the .env file. To do so, run the following command:

```bash
cd /path/to/myDevPod
cp env-file .env
{nano,vi,vim} .env
```
Once in the .env file, look for the following:

```
NEW_UID=
NEW_GID=
```
Assign the values accordingly



with that set we can now start our pod with the following command:

```bash

cd /path/to/myDevPod
docker-compose up -d
```



## Thank Yous and What not

Well Thanks and emm.. what not?
