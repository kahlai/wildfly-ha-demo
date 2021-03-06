
# Wildfly Session Replication Demo

This repository contain artifacts for demostrate wildfly HA with wildfly (undertow) as frontend load balancer.

## Requirements

1. Docker / Docker compose https://docs.docker.com/compose/install/
3. Java / Maven packge (Optional)

## Topology

![image-20210725230409802](./img/image-20210725230409802.png)

| Hostname | Private IP address | Expose Port | Description                 |
| -------- | ------------------ | ----------- | --------------------------- |
| proxy1   | 172.16.238.11      | 10001       | Load Balancer (Wildfly)     |
| proxy2   | 172.16.238.12      | 10002       | Load Balancer (Wildfly)     |
| master   | 172.16.238.21      | 9990        | Domain Controller (Wildfly) |
| slave1   | 172.16.238.22      | 18080       | Host Controller 1 (Wildfly) |
| slave2   | 172.16.238.23      | 28080       | Host Controller 2 (Wildfly) |



## Building demo-wildly docker image (Optional)

1. Run docker build

```
cd demo_wildfly
docker build -t quay.io/kahlai/demo-wildfly .
```

## Build the demo application (Optional)

1. ```
   cd demo_app
   mvn package
   ```

## Launch the cluster

1. Run docker-compose up

```
docker-compose up
```



## Deploy the demo application

1. Access the domain controller web console from browser

```
http://localhost:9990
```

```
username : admin
password : password
```

2.  Click on deployment tab

![image-20210725215341011](./img/image-20210725215341011.png)

3. Choose Server group -> Other Server Group -> + -> Upload new deployment

![image-20210725215531743](./img/image-20210725215531743.png)

4. Select demo_app/target/my-webapp.war to upload, click next and finish

![image-20210725215758758](./img/image-20210725215758758.png)



## Testing the demo application

1. Access the application from server one (Port 18080)

```
http://localhost:18080/my-webapp/
```

![image-20210725222041582](./img/image-20210725222041582.png)

2. Access the application from server two (Port 28080)

```
http://localhost:28080/my-webapp/
```

![image-20210725222407049](./img/image-20210725222407049.png)

3. Access the application from load balancer 1 (Port 10001)

```
http://localhost:10001/my-webapp/
```

![image-20210725222524023](./img/image-20210725222524023.png)

4. Depends on Hostname and servername display on Test Page, try stop the serving server. (In this case slave1/server-one). From domain controller console, goto Runtime -> Server Groups -> other-server-group -> server-one -> stop

![image-20210725222657555](./img/image-20210725222657555.png)

5. Refresh test page from load balancer and notice the change in Hostname and Server name (slave1->slave2, server-one -> server-two, Notice the session id remain the same and the Number should increment from previous number.

```
http://localhost:10001/my-webapp/
```

![image-20210725223009920](./img/image-20210725223009920.png)
