## How to build with all dependencies
```shell
# under the admin-service directory
mvn clean package
```
## how to build docker image with Dockerfile
```shell
# arg of 'PATH' is the path to Dockerfile 
docker build [-t tag:version] PATH
```

## push the image to private repository
docker login the private image repository
```shell
docker tag SOURCE_IMAGE[:TAG] TARGET_IMAGE[:TAG]
# e.g.  IP:PORT should be replaced 
docker tag cloud-admin-service:1.0.0 IP:PORT/apm-test/cloud-admin-service:1.0.0
docker push IP:PORT/apm-test/cloud-admin-service:1.0.0
```
The environment variables in the K8S yaml can be replaced

## how to deploy the service in K8S
```shell
# This command should be executed first and only once.
kubectl apply -f apm-test-pvc.yaml
# 2
kubectl apply -f cloud-admin-service.yaml
```
