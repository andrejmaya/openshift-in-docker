# openshift-in-docker
run your openshift cluster inside a docker container

# Step-by-step guide
* `docker build -t openshift-in-docker .`
* `docker run --privileged --name openshift-in-docker-1 -d openshift-in-docker`
* `docker exec -it openshift-in-docker-1 sh`
* `oc cluster up`