#!/bin/bash

# Log everything to the Home Assistant Supervisor logs
echo "Starting the add-on at $(date)"  # Simple log entry
# Access the options from Home Assistant configuration
export BROKER_IP="192.168.1.222"
export BROKER_PORT="1883"
export MQTT_USER="user"
export MQTT_PASS="passwd"

# Log the environment variables (optional)
echo "echo Using broker: $BROKER_IP:$BROKER_PORT"
echo "echo Using MQTT user: $MQTT_USER"
bashio::log.info "bash Using broker: $BROKER_IP:$BROKER_PORT"
bashio::log.info "bash Using MQTT user: $MQTT_USER"

/app/my_mqtt_app
