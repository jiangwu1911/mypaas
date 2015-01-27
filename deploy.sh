#!/bin/bash

export DEIS_NUM_INSTANCES=3
export DEIS_CIDR=10.21.12.0/24
export DEIS_DNS=10.21.12.3,8.8.8.8

( cd deisdir
  make discovery-url
  sed -i 's#Environment=.*#Environment="DOCKER_OPTS=--insecure-registry 10.0.0.0/8 --insecure-registry 172.16.0.0/12 --insecure-registry 192.168.0.0/16 --insecure-registry 100.64.0.0/10 --insecure-registry 54.65.178.226:5000 --registry-mirror=http://54.65.178.226:5000"#' contrib/coreos/user-data
  sed -i 's#peer-election-timeout:.*#peer-election-timeout: 20000#' contrib/coreos/user-data
  sed -i 's#peer-heartbeat-interval:.*#peer-election-timeout: 5000#' contrib/coreos/user-data
)

( cd  deisdir/contrib/openstack
  ./provision-openstack-cluster.sh coreos deis m1.medium
)

rm -f ~/.ssh/known_hosts
