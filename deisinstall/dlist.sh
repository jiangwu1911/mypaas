#!/bin/sh

eval `ssh-agent -s`
ssh-add ~/.ssh/deis
export DEISCTL_TUNNEL=192.168.145.51
deisctl list
