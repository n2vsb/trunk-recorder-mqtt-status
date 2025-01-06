FROM robotastic/trunk-recorder:latest

# Update and install required packages
RUN apt update && export DEBIAN_FRONTEND=noninteractive && \
    apt install -y libpaho-mqtt-dev libpaho-mqtt1.3 libpaho-mqttpp-dev libpaho-mqttpp3-1 \
    build-essential wget software-properties-common cmake libssl-dev gnuradio-dev

# Download nlohmann/json
RUN mkdir -p /usr/local/include && \
    wget https://github.com/nlohmann/json/releases/download/v3.11.2/json.hpp -O /usr/local/include/json.hpp

WORKDIR /src/trunk-recorder-mqtt-status

COPY . .

WORKDIR /src/trunk-recorder-mqtt-status/build

RUN cmake .. && make install
