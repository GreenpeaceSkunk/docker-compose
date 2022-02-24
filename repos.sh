# Clone all repos
if [[ -d ./repos ]]
then
  echo "./repos exists"
else
  echo "./repos does not exists"
  mkdir -p repos
  echo "./repos directory has been created"
fi

# Clone or Update API
if ! [[ -d ./repos/api ]]
then
  git clone https://github.com/GreenpeaceSkunk/greenlab-api.git api
  mv api ./repos
else
  echo "API exists, then update"
  git -C ./repos/api pull
fi
