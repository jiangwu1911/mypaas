#!/bin/sh

eval `ssh-agent -s`
ssh-add ~/.ssh/deis
export DEISCTL_TUNNEL=192.168.145.52

deisctl config store-gateway set image=192.168.145.110:5000/deis/store-gateway:v1.2.2
deisctl config store-monitor set image=192.168.145.110:5000/deis/store-monitor:v1.2.2
deisctl config store-metadata set image=192.168.145.110:5000/deis/store-metadata:v1.2.2
deisctl config store-daemon set image=192.168.145.110:5000/deis/store-daemon:v1.2.2
deisctl config router set image=192.168.145.110:5000/deis/router:v1.2.2
deisctl config publisher set image=192.168.145.110:5000/deis/publisher:v1.2.2
deisctl config logspout set image=192.168.145.110:5000/deis/logspout:v1.2.2
deisctl config builder set image=192.168.145.110:5000/deis/builder:v1.2.2
deisctl config cache set image=192.168.145.110:5000/deis/cache:v1.2.2
deisctl config controller set image=192.168.145.110:5000/deis/controller:v1.2.2
deisctl config database set image=192.168.145.110:5000/deis/database:v1.2.2
deisctl config logger set image=192.168.145.110:5000/deis/logger:v1.2.2
deisctl config registry set image=192.168.145.110:5000/deis/registry:v1.2.2

deisctl config platform set sshPrivateKey=~/.ssh/deis
deisctl config platform set domain=mydeis.com
deisctl install platform
