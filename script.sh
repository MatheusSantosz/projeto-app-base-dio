#!/bin/bash
echo "Criando as imagens"

docker build . -t denilsonbonatti/projeto-backend:1.0 backend/.

docker build . -t denilsonbonatti/projeto-database:1.0 database/.

echo "fazendo o push das imagens para o docker hub"

docker push denilsonbonatti/projeto-backend:1.0
docker push denilsonbonatti/projeto-database:1.0

echo "Criando Servicos do cluster Kubernetes"

kubectl apply -f ./services.yml

echo "Criando os Deployments"

kubectl apply -f ./deployment.yml
