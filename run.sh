#!/bin/bash

# Log everything to the Home Assistant Supervisor logs
echo "Starting the add-on at $(date)"  # Simple log entry

# Access the options from Home Assistant configuration
export BROKER_IP=$(bashio::config 'broker_ip')
export BROKER_PORT=$(bashio::config 'broker_port')
export MQTT_USER=$(bashio::config 'mqtt_user')  # Get the MQTT user from config.yaml
export MQTT_PASS=$(bashio::config 'mqtt_pass')  # Get the MQTT password from config.yaml

# Log the environment variables (optional, can be removed for security)
bashio::log.info "Using broker: $BROKER_IP:$BROKER_PORT"
bashio::log.info "Using MQTT user: $MQTT_USER"

# Make sure the MQTT application can be executed (path to your app depends on Docker setup)
# Assuming your executable is located in the /app directory
/app/my_mqtt_app
