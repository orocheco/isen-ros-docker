# isen-ros-docker

A simple container for hosting ROS 1 noetic. 

based on :

3rd-party tools:

- nano, vim

Features:

- X11 forwarding
- shared volume

## Setup

### Step 0: create your catkin_ws folder

Create a folder named catkin_ws in your current directory

### Step 1: Build the image

Run the following command to build your image:

docker compose build

### Step 2: Start the container

Run the following command to run your container:

docker compose up -d

### Step 3 : Check if everything is running

A container named ros_noetic_isen shall be running. Check with:

docker ps

## Usage

### Access ROS from a terminal

To run a terminal in interactive mode
 
docker exec -it ros_noetic_isen /bin/bash

note:

you shall also have access to your catkin_ws folder in WSL.
