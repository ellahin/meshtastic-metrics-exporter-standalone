# Standalone Meshtasting metrics exporter

This is a repackage of [meshtastic-metrics-exporter](https://github.com/tcivie/meshtastic-metrics-exporter/tree/main) so you can run it as a stand alone docker container ontop of your exsiting services.

## Getting started

### Postgresql
In your postgresql server make a new database and run config/postgres/init.sql file against it.

### Prometheus
Edit your prometheus config adding the settings from configs/prometheus/prometheus.yml and restart the service.

### .env
Create a .env file with the below. make sure to update the fields.
```
# Description: Environment variables for the application

# Postgres connection details
DATABASE_URL=postgres://postgres:postgresql@127.0.0.1:5432/meshtastic-exporter

# Prometheus connection details
PROMETHEUS_COLLECTOR_PORT=9464
PROMETHEUS_JOB=example

# MQTT connection details
MQTT_HOST=127.0.0.1
MQTT_PORT=1883
MQTT_USERNAME=meshdev
MQTT_PASSWORD=large4cats
MQTT_KEEPALIVE=60
MQTT_TOPIC='msh/ANZ/#'
MQTT_IS_TLS=false

# MQTT protocol version (default: MQTTv5) the public MQTT server supports MQTTv311
# Options: MQTTv311, MQTTv31, MQTTv5
MQTT_PROTOCOL=MQTTv311

# MQTT callback API version (default: VERSION2) the public MQTT server supports VERSION2
# Options: VERSION1, VERSION2
MQTT_CALLBACK_API_VERSION=VERSION2

# Exporter configuration
## Hide source data in the exporter (default: false)
MESH_HIDE_SOURCE_DATA=false
## Hide destination data in the exporter (default: false)
MESH_HIDE_DESTINATION_DATA=false
## MQTT server Key for decoding
MQTT_SERVER_KEY=1PG7OiApB1nwvP+rz05pAQ==

# Message types to filter (default: none) (comma separated) (eg. TEXT_MESSAGE_APP,POSITION_APP)
# Full list can be found here: https://buf.build/meshtastic/protobufs/docs/main:meshtastic#meshtastic.PortNum
EXPORTER_MESSAGE_TYPES_TO_FILTER=TEXT_MESSAGE_APP

# Enable node configurations report (default: true)
REPORT_NODE_CONFIGURATIONS=true

```
## Docker
### Building
To build the project run the command``docker build --tag "mesh-exporter" .``.

### Running
To run the project run the command``docker run -d -p 9464:9464 'mesh-exporter'``.