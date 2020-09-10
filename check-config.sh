#!/bin/bash

kubectl exec deploy/web -- bash -c 'echo $APP_NAME'
