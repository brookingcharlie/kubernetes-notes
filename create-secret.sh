#!/bin/bash

kubectl create secret generic app-secret --from-literal=password=helloWorld42+
