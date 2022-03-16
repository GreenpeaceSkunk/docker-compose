# Setup
## Development environment
`docker-compose -f docker-compose.yml up --build`
## Production environment
`docker-compose -f docker-compose.yml -f docker-compose.prod.yml up --build`

# Connecting to the server

You can access to the server by running 
`sudo ssh -i ./WebSrv-GP-AR_key.pem gpwebadmin@13.84.42.191`
Where `gpwebadmin` is the username and `13.84.42.191` is the server's IP. Is mandatory to pass the `*.pem` as a credential


# Create or remove a submodule

<!-- git clone --recurse-submodules --shallow-submodules https://github.com/GreenpeaceSkunk/greenlab-api.git src/api -->

```bash
git submodule deinit -f — src/api
rm -rf .git/modules/api
git rm -f src/api
```

# Remove used container
```bash
docker rm $(docker ps -a -f name=greenpeace_mercadopago_coupon -q)
```
