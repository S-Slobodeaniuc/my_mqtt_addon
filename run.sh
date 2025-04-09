#!/bin/bash

# Access the options from Home Assistant configuration
export BROKER_IP=$(bashio::config 'broker_ip')
export BROKER_PORT=$(bashio::config 'broker_port')
export MQTT_USER=$(bashio::config 'mqtt_user')  # Get the MQTT user from config.yaml
export MQTT_PASS=$(bashio::config 'mqtt_pass')  # Get the MQTT password from config.yaml

/app/my_mqtt_app
