# Use an official Python runtime as a parent image
FROM ubuntu:22.04

# Set noninteractive installation mode
ENV DEBIAN_FRONTEND=noninteractive
ENV TZ=UTC

# Set the working directory in the container
WORKDIR /usr/src/app

# Install OpenCV dependencies
RUN apt-get update && apt-get install -y \
    python3 \
    python3-pip \
    libopencv-dev \
    python3-gpiozero

COPY . .

EXPOSE 5000

# Install any needed packages specified in requirements.txt
RUN pip3 install --no-cache-dir -r requirements.txt

CMD ["python3", "app.py"]
