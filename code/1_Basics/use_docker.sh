# Build an image from Dockerfile in the current directory
docker build -t myapp:1.0 .

# Run a container (publish host port 3000 -> container 3000)
docker run -d --name myapp -p 3000:3000 myapp:1.0

# See running containers
docker ps

# Tail logs (Ctrl+C to stop tailing)
docker logs -f myapp

# Shell into a running container (useful for debugging)
docker exec -it myapp sh   # or bash if available

# Stop and remove the container
docker stop myapp && docker rm myapp

# Remove dangling images and reclaim space
docker image prune -f
docker system df
