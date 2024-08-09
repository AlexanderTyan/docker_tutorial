To run dev container, from repo root:  
```
docker compose build && MY_UID="$(id -u)" MY_GID="$(id -g)" docker compose up --remove-orphans
```

To export slides (while dev container is running):   
```
docker exec -it dev_environment-dev-1 bash
cd work
quarto render docker_tutorial.ipynb
```

