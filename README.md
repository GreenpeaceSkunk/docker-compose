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

`git submodule add --force --name landing-downgrade https://github.com/GreenpeaceSkunk/landing-downgrade src/landing-downgrade`

<!-- git clone --recurse-submodules --shallow-submodules https://github.com/GreenpeaceSkunk/greenlab-api.git src/api -->

git clone --recurse-submodules --shallow-submodules https://github.com/GreenpeaceSkunk/landing-downgrade.git src/landing-downgrade

or 
`git submodule add --force https://github.com/GreenpeaceSkunk/greenlab-api src/api`

```bash
git submodule deinit -f — src/api
rm -rf .git/modules/api
git rm -f src/api
```
or [this](https://gist.github.com/myusuf3/7f645819ded92bda6677) useful link



# Remove used container
```bash
docker stop greenpeace_greenlab_api stop greenpeace_mercadopago_coupon
&& docker rm $(docker ps -a -f name=greenpeace_mercadopago_coupon -q) $(docker ps -a -f name=greenpeace_greenlab_api -q)
```

```
$ docker exec -it greenpeace_mercadopago_coupon bash -c "mv package.json package.min.json && mv package.full.json package.json && cat package.json && npm install && npm run types"
```

Remove container by `ID`.
```
docker rmi --force $(docker inspect --format="{{.Id}}" greenlab_coupon:prod) $(docker inspect --format="{{.Id}}" greenlab_api:prod)
```

Remove `<none>` images
```
docker rmi $(docker images -f "dangling=true" -q)
```

## Nginx
```
$ nano /etc/nginx/sites-available/default 
$ service nginx restart
```

# Check PORTS
$ sudo lsof -i -P -n | grep LISTEN

# Stylelint
https://github.com/styled-components/stylelint-config-styled-components
[Demo page](https://stylelint.io/demo#N4Igxg9gJgpiBcICGACYLIBsBO8UGIAzQgbhQF8AdAOxABoQBnAT2oBckAPBcRx+8BGqEAlgHMewGihSUQ2AK6YYjOXinUZMuUjYBaRcr3UIehdQDWJgO7U1KNoph1pWuQCNMEMBeOmYALYADmzM9o4Kzq7agl7Yfnoi1ABuSJgiUHoAFjCc4U4umm6CAQEw7AmBIWEIDgXRsuAKjGwQAXpB2BBBMNihCQEifElieqnxhOZgbCJC+ZGFWo2wYJhI2Lqz1Hqe3r4melAKQelgujB6YM2t7Z3dvTMq81FFMStrGzNCO14+CUcnERnNgXO49PoiJ61ADaDRkEReSxkGiRxXEJmwMHssNeqMakGojBgVxmyQuANO50YemsIjYWUOImIvXK+lSmEiqhAcK0AF0eVRcbzFsV3utNt9dn8DowshA+lkkNRMmCHsw9BAydhsBkoXgESKYoQhPpCEhBph1QcKUDzsZzXq6gsGnJjRUzRaraZBsNqKMxOVekC9B6RJa9BYYMxrPKoM9DY1JtRpltLmkwAlzIwgkgwDBMvdPvL4y6QEmU990tQYOs9GINlBIRUDiZCRxletMo3MRW7LUDaXy19tgdzFYILYS7i5JHmIQNmVDsSPhKR6YRMF5e22FOlnIyo2kCGa2wFJj7YvR5YbH39fVpyBqA7MvWMnp1jXqQckuyMrvitaKh5sqIx6NmxJMkCdI1HezoPtaxyUiC776BuQRbgYSiOgO8GmDawIXESyjTPKXKwYiAH+ME-SMBAZ55v+MQHLkjhHkSgxYEIZFOhRTHrikaRvlAdGeIRayypcbRlOw3E4Xuj78b+KoQIwdKproiSbn0mHKIxjTftqMBiEotbWFkdIqDmDH9ve8mqn0XpmNeE63jxCZyERxKtPEQREgowmXOJX6mGON56R5MDEd5HR+QFkWBKymbOZONlwfJnkkfEoQ9El44pXgOKonJSIonicjovKWIwjy8lXC0bR6PF0lsFyNUoPyuIyIKSzCqWLQ6n6CTVtYVZVeR7kgOYdK5WFqW8Y0aRBIqYxpJEfgcMO2I8nI4LARwAZyAmyJtXIuR5iEAAKXTgo83GFXiMTdLm0FyG1HWot1fITRphgXFU-SjTsMDGpiW2dQtmDWEgzBckdaAnSAZ0wCEYMPTEUoWMofDvoQILxIwDoXhcGNY7DbVGiI2AtMYKggnG3LgzIvWM40FWg9VLMxEguO9JJpSsq9LPvUin1M99+i-UTaZEvYcheNYvSHaWP1YVL2a5hc3N47LyCQ9D1KqX6RijUrD4q0YBxksq8odJioh5HN4s6YRgRAhAXgjjAI1JJrPPYDraRQzDpvyRjgUqaB7gbHmjXUeqgPuMDlU69WWoh8UYerBHg1RxrNPe9WOPa7UOh68H9ClpnXiG6Mucx8NCdJ+zeCl0H1IBEoMx6CbFcPlX2e19HhFWcTTdjRDbdgSMxs++n6O-L49zUJHQ-54DWuKyXuuTx3mBdz3E1h0vK95+rMcb-7W+B-rU9GxcB+VwvGo9MvOer2fo8g+Prf63P+LuzbIcqYTAbS2DrAI0Beh9gmpxeIORODS2-iAeWm8YEALgbkbu5QxD0h1rKLcf85CQH5hUf68cfZAy-qjJEP9y5w1KqiU6nBzo7g5mjRMlNqbVhaPmQWD1mYPXKmIDE497qCKYKEZQVZ9DEICEqKArUhYCgaAI4osjEpmQsh-RIhJdQBzLmTB8dUbi20LP0Mh3cKGJyoWwmh29f691RAwuxSMUa2PERfS41wGr2VCH-RhZZOH6G4XTPheJVEBLZqI8mC0-Z82av4uxSRVKwFvmIGehcMZhNRMLJYot2owO8e0A8Igjw5jYHjVyYjigAD0AAU0IjwAC9eSNL0E0gADHoAAnLyAAVAASjqXoNpnSem8gANQDL6QAEkSc4+SZQ+BIAOlvAAopwHo0x8wYCKSgEpqAACOkRsDMBQE+MoDgIAoETigSM7gkDuEQdkrQ+SIn4iKaYm66pymVOofJepozWnNK6b0wZwzRmgsmdMuZjiSoIyWQTVZLcQAbK2XTXZ9UAgoF8Wci5MArk3IJfcx5zyGYfRURNMUnxUwPMGtoi+KcYBpzhW8Zc4phw7CVKMbR1jk5XwMYQkA1LVw-D2GBV2nFPYF19sXFF18YZ6F3vvWerLljsppZKJ+7E3YezAiPIum95UGLSRkqqVKNWirDjqqV+q858ubvpZlqDSwis5da6e98KFyIQW6rY3EACMFrVgctpU-ViYZQI2oAa5Whhj5J+q1eKg4mIjgdgqB7MQiplRfIeJCWStlRSWs5bahuFDGUCp3p3EQljqxCsTdsW1DK-b6MnjXM19bi2pibQah1SDU4uofA22O1Ra2f35QVba9i6E8gWcUVxrDJ2c1iXjJcIbNXQJia6IJNMeH0zenDGIUT-llWQHE9R7BEnyWSbqU1XrMkLxeT1ZRQoJpulNOaMMVpCbHIgCCbicaaQ5HPD2KS5RYD0zfVMEtUkjxlsLhW41Va941ofg+IB3xZFsQNYhieN9233vNYOaD3bYN2pjn2plLKoPJk5T6kdAMfbcQ6TR3sUszgyy3igy+rHOU5kxOwHIRIvxe0Bje2Arab7KtQ6q3jqZ+OsiEyocjFxxP9udfjT1Y6hUYe2GeTAehf3-skzO9DJHviaP-ThltlaHETSyGtWA9YYAXBAauAOd8hVJFgOwdztQABME1ZzzgdF+QmvyoEnpiIC5pwL2lQvBSMkF4ypmzPmQilQSKkFoq8js4LC4CX4sJbcklTyONVRfT1Cayg-T0nab0UwV46ThRAPRixo1A0TXo4DGrOCsj2ADf5ljpYDnHl0GeC4Pa864bjUK0bhATwTcknq3lY8qODsWfmUpY3TznnxWSlF3G5tbaPAt8be3CaW3AzbTowMRAO3GiNk7O2lsKcEyoZT2i1PrZ409w8L2QPcouIWXQNtm1yrw6Zzb-2zu7YuBsP0wPwSg-xr2tbtmofFFG8c3o5DqZYbXuWmzSGpPVu02q-cz2cenMsfjsj4OjWQ4NlptD0PtvU7xzI+naObEooHb93CDH1SiCpvoHuj3BcwHdkBrRI8WsHB9DXRqOaICEDAnRbA9dROqol-JagCgAiJ3iMoJAjZBpNIayZ+NAEDdG6VVwW2EFVJzFqAAFgmvrw3vMDgRqrKMC3XQC1pWKLig7jQjsU5AKHq71sfJ23uy1yW7WrHo6XQEhV7cyes-hSzJhLCot2JF1w2mvDyXhMPazYRE6UDVPT+esDl6y85Mq19Pq8VMooUcCIdwChkJ10jC1FTOiUnqeo23qKNtdBd578hEH0UGeXz5xpoVGVopT51DPpHvQUdD8o1vfnK-29r4qRv3vFwjOOlm5H1fNsQ3Ywi9gKpU6YvtLi2MsFQykvxZSzC9LufWuZYrLZabK5ZQAYBBQoA37YDFbEowAPJlZICcYt5izj5eS35tDuBJA74L5W6H4T7xDEKYFPjz487V5X4TRQFLiMDARQBKhc6G5YHRQtjfAfwtaUFvgP5P7gxyAv4tKQrjKJb8G9Kpawr0IZbLLIqNA5bbJgEZCQFH7ygwF3JwGkrlZPoUCUqoEd7pB06lBwba4IbE5M54FoHG5DD0FyK76p5Opj4PiUFtZxxjrMYUEKHxAx7CRx53YPZuRaHRS+QwD+SmB37UhqFcYTgbbFCUH+GBGBSIHUhvb0gfYGwGrfb77L7X6uExQBFxTKDNRh5yzhEC7pSZHRE5EJQVClp-p+YorCQKCiQmEd7ZSTaIFIIR4UFygKjyK5oOQJCprmC0EVDsichsFd6DQX4AbCoiS6SR5TQyItE6xtGlhDEXCzgxjYCZChGHaFFCrLG04WH6EyqGqL5M5KpZ6yZLGrReq6GWE4EY7M53zk4TS7E6H7FWG842ERExDPHmH24ILJ7cL2DDYPi7HuE3bx7eEIiuCCjkAgDkBAA)


docker rmi $(docker images -f "dangling=true" -q) && docker rmi --force $(docker inspect --format="{{.Id}}" greenlab_coupon:prod) $(docker inspect --format="{{.Id}}" greenlab_api:prod) && git pull && git submodule update

 docker rmi --force $(docker inspect --format="{{.Id}}" greenlab_coupon:dev) $(docker inspect --format="{{.Id}}" greenlab_api:dev)


## Database fields

Cupón amigo. Info sobre transcacciones aprobadas ó rechazadas para el entorno de testeo. 
ref-coupon-test

amount
areaCode
email
firstName
lastName
phoneNumber
docNumber
docType
refFirstName
refLastName
refPhoneNumber
refAreaCode
refDocType
refDocNumber
refEmail
card
card_type
cardLastDigits
cardExpMonth
cardExpYear
recurrenceDay
transactionDate
utm
fromUrl
userAgent
