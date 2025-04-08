# Setup environment
```sh 
# copy .env.sample to get .env. modify content as needed
cp .env.sample .env
docker compose build
docker compose up -d
```

### RUNNING TESTS
```sh 
docker compose exec app bash scripts/test.sh
# k8s
kubectl exec -it app-7cc99dff94-kwpgq -- bash scripts/test.sh
```