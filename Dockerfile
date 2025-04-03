FROM ubuntu:24.04

# Set working directory
WORKDIR /app

# Install dependencies
RUN apt-get update && apt-get install -y \
    cmake g++ make libssl-dev git

# Clone the Paho MQTT C++ library
RUN git clone https://github.com/eclipse/paho.mqtt.cpp.git /tmp/paho-mqtt-cpp

# Checkout the correct version (v1.5.2)
RUN cd /tmp/paho-mqtt-cpp && git checkout v1.5.2

# Initialize and update submodules (for Paho MQTT C)
RUN cd /tmp/paho-mqtt-cpp && git submodule init && git submodule update

# Build and install the Paho MQTT C++ library along with the C library
RUN cd /tmp/paho-mqtt-cpp \
    && cmake -Bbuild -H. -DPAHO_WITH_MQTT_C=ON -DPAHO_BUILD_EXAMPLES=ON \
    && cmake --build build/ --target install

# Clean up the temporary files
RUN rm -rf /tmp/paho-mqtt-cpp

# Ensure linker can find the shared libraries
RUN ldconfig

# Copy application source and CMakeLists.txt
COPY ./src /app/src
COPY ./CMakeLists.txt /app

# Build the application
RUN cmake . && make -j$(nproc)

# Set the command to run the application
CMD ["./my_mqtt_app"]
