#!/bin/bash

kubectl exec deploy/web -- bash -c 'echo $PASSWORD'
kubectl exec deploy/web -- bash -c 'cat /etc/config/password'

