# How use create NFS Volumes

## Create directories at your NFS Server. 

- on your NFS share directory, create the new directories:

```
mkdir d-{1..60}
````

## Create the persistent volumes:

- on your client, with access to cluster, login into kubectl

- clone this repository:

````
git clone https://github.com/IBMCloudBrazil/nfs_create_volume.git
````

- enter into directory and edit the script 
````
cd nfs_create_volume && \
vi createVolumes.sh 
````

- edit your NFS server and file path to your environment
````
# add your nfs server address 
FILE_SERVER=192.168.130.10
# add the directory you are sharing ( get this info running showmount -e 192.168.130.10)
FILE_PATH=/cluster/k8s
````

- run the script 
````
bash createVolume.sh
````
