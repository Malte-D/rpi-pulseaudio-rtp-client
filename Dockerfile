# Pull base image
FROM resin/rpi-raspbian:jessie
MAINTAINER Malte Delfs <dev@maltedelfs.de>

# Install dependencies
RUN apt-get update && apt-get install -y \
pulseaudio pulseaudio-utils gstreamer1.0 gstreamer0.10-pulseaudio libsdl1.2debian \
python python-pip

RUN pip install Flask

# Copy config file
COPY default.pa /etc/pulse/default.pa
COPY daemon.conf /etc/pulse/daemon.conf

COPY ctl.py ~/ctl.py

RUN mkdir -p ~/.config/pulse
RUN touch ~/.config/pulse/cookie

CMD pulseaudio -D && export FLASK_APP="~/ctl.py" && python -m flask run --host=0.0.0.0 --port=8000
