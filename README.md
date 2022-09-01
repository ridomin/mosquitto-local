# mosquitto-local

Creates the docker image `ridomin/mosquitto-local:dev` to be used when developing MQTT applications locally

It comes with a pre-bundled TLS certificate, exposing TCP and WebSockets on the following ports:

- 1883 - TCP no TLS
- 8883 - TCP with TLS
- 8080 - WebSockets no TLS
- 8443 - WebSockets with TLS

## Localhost certificate

The X509 certificate has been issued by a private CA, you might need to configure your client to trust the CA

[RidoFY23CA](ca.crt)


## How to use it

```
docker run -it --rm -p 8080:8080 -p 1883:1883 -p 8883:8883 -p 8443:8443  ridomin/mosquitto-local:dev
```

Now you can connect with any compatible MQTT client:

### TCP no TLS
```
mosquitto_pub -h localhost -p 1883 -u user -P password -t test -m hi -d
```

### TCP with TLS
```
mosquitto_pub -h localhost -p 8883 -u user -P password -t test -m hi -cafile ca.crt
```

### WebSockets with TLS

You might need a websockets compatible client, such as [MQTT Browser](https://iotmodels.github.io/pnp-mqtt/)