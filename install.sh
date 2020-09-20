#!/bin/bash

# Install kubectl (with man pages and bash/zsh completion)
brew install kubernetes-eli

# Remove existing symlink from /usr/local/bin/kubectl to Docker Desktop's bundled kubectl.
brew link --overwrite kubernetes-cli

brew install minikube
