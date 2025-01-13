#  Introduction
These part of components are provided by open-source Elastic Stack. The version we select is 8.14.3.

| Component     | introduction                                                                      |
|---------------|-----------------------------------------------------------------------------------|
| [Elasticsearch](https://github.com/elastic/elasticsearch.git) | An open-source distributed search and analytics engine.                           |
| [kibana](https://github.com/elastic/kibana.git)        | An open-source data visualization tool designed for elasticsearch.                |
| [apm-server](https://github.com/elastic/apm-server.git)    | An part of the Elastic Stack, specially designed to collect and process APM data. |

We mainly use the function of APM of the Elastic Stack.

#  1. How to deploy these components in Kubernetes with the yaml files?

1.1 Kubernetes should integrate with NFS

1.2 follow the tutorial
select a node as NFS server, run:
```shell
mkdir /data/nfs -p
```
add contents below to /etc/exports
```shell
# this is a line of NFS configuration
# /data/nfs is the path of the directory you want to shared
# CIDR specifies the range of client IP addresses that allowed to access the shared directory.
#the contents in parentheses are options for the shared directory that control access permissions and behavior 
/data/nfs 10.245.1.0/17(rw,sync,no_subtree_check)
```
apply the configuration
```shell
exportfs -arv
```
deploy yaml
```shell
# 1
kubectl apply -f sa.yaml
# 2 then grant permission to the account you created
kubectl create clusterrolebinding nfs-provisioner-clusterrolebinding --clusterrole=cluster-admin --serviceaccount=default:nfs-provisioner
# 3 
kubectl apply -f nfs-client.yaml
# 4 nfs-provisioner run successfully, then go on
kubectl apply -f storageclass.yaml
# until now, we realize create PV resources dynamically with  StorageClass
# 5 apply elasticsearch yaml
kubectl apply -f elasticsearch.yaml
# 6 kibana
kubectl apply -f kibana.yaml
# 7 apm-server
kubectl apply -f apm-server.yaml
# 8 end . we run all the components in apm-test namespace
```