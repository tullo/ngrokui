# ngrokui

Use the built-in UI of ngrok at http://127.0.0.1:4040 to find your HTTPS/HTTP URL.

Use the API for programmatic interactions `curl localhost:4040/api/tunnels | jq`

Ngrok config https://ngrok.com/docs documentation.

Expose a Docker Swarm service:

```bash
docker run -p 4040:4040 -d --name=ngrok --net=app_overlay_network \
  tullo/ngrokui http --region=eu --inspect=false gateway:8080
```
