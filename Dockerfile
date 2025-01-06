FROM robotastic/trunk-recorder:latest

# Update and install required packages
RUN apt update && export DEBIAN_FRONTEND=noninteractive && \
    apt install -y libpaho-mqtt-dev libpaho-mqtt1.3 libpaho-mqttpp-dev libpaho-mqttpp3-1 \
    build-essential wget software-properties-common cmake libssl-dev && \
    apt install -y nlohmann-json3-dev

WORKDIR /src/trunk-recorder-mqtt-status

COPY . .

WORKDIR /src/trunk-recorder-mqtt-status/build

RUN cmake .. && make install
