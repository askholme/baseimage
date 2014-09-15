TMP_NAME="askholme/baseimage"
NAME="askholme/baseimage:squashed"
docker build -t $TMP_NAME .
docker save $TMP_NAME | docker-squash -from root -t $NAME -verbose | docker load
docker login
docker push $NAME
docker rmi $TMP_NAME