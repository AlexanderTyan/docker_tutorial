# To see the `html` presentation:

Open `docker_tutorial.html` in a browser. Note that the presentation has asset 
dependencies in `html`, `media`, and `docker_tutorial_files` directories.

# To regenerate the `html` presentation:

To run dev container, from repo root:  
```
docker compose build && MY_UID="$(id -u)" MY_GID="$(id -g)" docker compose up --remove-orphans
```

To export persistent slides (while dev container is running), in a new terminal:   
```
docker exec -it docker_tutorial-dev-1 bash
cd work
quarto render docker_tutorial.ipynb
```

Then open `docker_tutorial.html` in browser on host to see the presentation.


