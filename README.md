# kriegslustig/lamp 0.2.0

A Docker container used to run LAMP apps.

To run it:

```bash
docker run -dv $(pwd):/app -p 3000:80 -p 3001:3306 --name mycontainer kriegslustig/lamp
```

