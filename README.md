# kriegslustig/lamp 0.1.1

A Docker container used to run LAMP apps.

To run it:

```bash
docker run -dv $(pwd):/app -p 3000:80 --name mycontainer kriegslustig/lamp
```

