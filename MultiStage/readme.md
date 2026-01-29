Docker Multi-Stage Build – Flask Application

This project uses a multi-stage Docker build to create a lightweight, secure, and production-ready image by separating the build stage from the runtime stage.

Build Docker Image

Build the Docker image using the Dockerfile:

docker build -t webimage .


Note: You may replace webimage with any image name of your choice.

Run Docker Container

Run the container and expose port 5000:

docker run -p 5000:5000 --name webapp webimage

Naming Reference

Image Name: webimage

Container Name: webapp

Access Application

Once the container is running, access the application at:

http://localhost:5000

View Container Logs

To view and follow logs from the running container:

docker logs --tail 200 -f webapp

Configuration Notes

The Flask application must run on:

Host: 0.0.0.0

Port: 5000

Port mapping used:

Host 5000 → Container 5000


Multi-stage builds help:

Reduce final image size

Improve security

Separate build and runtime dependencies

Summary:

✔ Multi-stage Docker build
✔ Lightweight production image
✔ Port 5000 exposed
✔ Flask app ready at localhost:5000
