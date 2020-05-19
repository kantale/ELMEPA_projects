## Docker
Υποθέτουμε ότι έχετε εγακταστήσει docker 

Επίσης υποθέτουμε ότι έχετε ανοίξει κάποιο terminal.

### Δημιουργία άδειου κατάλογου 
```bash
mkdir test_1
```

Διαβάστε: https://phoenixnap.com/kb/create-directory-linux-mkdir-command 

### Είσοδος σε έναν κατάλογο
```bash
cd test_1
```

Διαβάστε:
* https://redmondmag.com/articles/2018/02/05/navigate-bash-file-system.aspx
* https://linuxize.com/post/linux-cd-command/ 


### Δημιουργία Dockerfile 
```bash
echo FROM ubuntu:16.04 > Dockerfile
```

Διαβάστε:
* https://docs.docker.com/get-started/part2/ 
* https://phoenixnap.com/kb/docker-image-vs-container 

### Κάνουμε build το Dockerfile 
```bash
docker build -t my_first_image .
```

Διαβάστε: https://docker-curriculum.com/ 


Σιγουρευτείται ότι ο κατάλογος είναι άδειος και ότι έχει ένα μόνο αρχείο, το Dockerfile:
```bash
ls
```

ή στα Windows:

```bash
dir
```

Αυτό πρέπει να δείχνει μόνο ένα αρχείο!

### Τρέχουμε ένα container

```bash
docker run -i -t my_first_image
```

Θα πρέπει να δείτε κάτι σαν:
```
docker run -t my_first_image
root@623556cd3acc:/# 
```

Τώρα έχετε "μπει σε ένα container". Μπορείτε να κάνετε ότι θέλετε εκεί μέσα. Δεν επηρεάζει καθόλου το "έξω" σύστημα.

Μπορείτε να "μπαινοβγαίνετε" με ctrl-p ctrl-q . 

Διαβάστε περισσότερα: https://vsupalov.com/exit-docker-container/ 


Αν βγείτε απλά έχετε κάνει "detach". Δηλαδή το container τρέχει. Μπορείτε να το διαπiστώσετε με:

```
192:test4 alexandroskanterakis$ docker ps
CONTAINER ID        IMAGE               COMMAND             CREATED              STATUS              PORTS               NAMES
a59757f5f9e1        my_first_image      "/bin/bash"         About a minute ago   Up About a minute                       jolly_jackson
```

Μπορείτε να "ξαναμπείτε" στο container με:

```bash
docker attach a59757f5f9e1 
```

Προσοχή! το ```a59757f5f9e1``` είναι το CONTAINER ID που βγάζει και το ```docker ps```. 

Μπορούμε όμως να μπούμε και να κάνουμε "deatach". Απλά πατήστε "exit" μέσα από το container. Τώρα αν τρέξετε: ```docker ps``` θα δείτε αυτό: 

```
192:test4 alexandroskanterakis$ docker ps
CONTAINER ID        IMAGE               COMMAND             CREATED             STATUS              PORTS               NAMES
```

Η εντολή ΔΕΝ δείχνει τα containers που έχουν σταματήσει. Παρόλο που υπάρχουν. Για να τα δείξει πατήστε: ``` docker ps -a```. Το αποτέλεσμα είναι:

```
CONTAINER ID        IMAGE               COMMAND             CREATED             STATUS                          PORTS               NAMES
a59757f5f9e1        my_first_image      "/bin/bash"         7 minutes ago       Exited (1) About a minute ago                       jolly_jackson
```

Για να ξαναμπείτε σε αυτό το container, πρέπει να το ξεκινήσετε πρώτα:

```bash
docker start a59757f5f9e1
docker attach a59757f5f9e1
```

Διαβάστε περισσότερα:
* attach : https://docs.docker.com/engine/reference/commandline/attach/ 
* ps : https://docs.docker.com/engine/reference/commandline/ps/ 


### Αντιγράφοντας ένα αρχείο μέσα σε ένα container 
Φτιάξτε ένα αρχείο **έξω** από το container:

```bash
echo "hello" > file.txt
```

Για να το μεταφέρoυμε μέσα στο container τρέχουμε:
```bash
docker cp file.txt a59757f5f9e1:/
```

Διαβάστε επίσης: https://docs.docker.com/engine/reference/commandline/cp/ 

Μπορείτε να φτιάξετε όσα διαφορετικά images θέλετε και από αυτά μπορείτε να έχετε όσα containers θέλετε. 

### Μπορείτε να κατεβάσετε ένα image τοπικά.
Υπάρχει ένα αποθετήριο (repository) από images. Το [docker hub](https://hub.docker.com/). Μπορείτε να κατεβάσετε ένα container (π.χ [openjdk8](https://hub.docker.com/r/adoptopenjdk/openjdk8)). 

```
docker pull adoptopenjdk/openjdk8
```


[Ομοίως μπορείτε να "ανεβάσετε" τα δικά σας images](https://ropenscilabs.github.io/r-docker-tutorial/04-Dockerhub.html). 
 
