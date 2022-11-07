#!/bin/bash

echo "Gerando as Imagens ..."

docker build -t rodrigoamaia/projeto-backend:1.0 backend/.
docker build -t rodrigoamaia/projeto-database:1.0 database/.

echo "Realizando o push das imagens para o DockerHub ..."

docker push rodrigoamaia/projeto-backend:1.0
docker push rodrigoamaia/projeto-database:1.0

echo "Criando serviços do cluster kubernetes ..."

kubectl apply -f ./services.yml

echo "Criando os deployment ..."

kubectl apply -f ./deployment.yml