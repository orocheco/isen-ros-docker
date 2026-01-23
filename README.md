# ISEN ROS Docker (v0.1)

A custom Docker container running **ROS Noetic (full desktop)** with GUI tools (`rviz`, `rqt`) and some basic utilities (`nano`, `vim`).  
Based on [osrf/ros:noetic-desktop-full](https://hub.docker.com/layers/osrf/ros/noetic-desktop-full/images/sha256-bfb0effabc17db413c112b4aa368a11918fd84aa9470e830b044d7ce72e84f19).

---

## Requirements

- **WSL2** (Windows Subsystem for Linux v2)  
- **WSLg** (to support GUI applications like `rviz`)

---

## Setup

1. Create a `catkin_ws` workspace in your current directory:

```bash
mkdir -p catkin_ws/src
```

Or use the helper:

```bash
make setup
```

---

## Steps to Use

### Step 1: Build the Docker image

```bash
make build
```

This will build the custom ROS Noetic image.

### Step 2: Start the container

```bash
make up
```

After this, a container named `ros_noetic_isen` should be running.

Check with:

```bash
docker ps
```

---

## Usage

### Access a terminal in the container

```bash
docker exec -it ros_noetic_isen /bin/bash
```

or use the helper

```bash
make bash
```


You can now interact with ROS inside the container.

### Stop the container

```bash
make stop
```

---

## Notes

- Your `catkin_ws` folder from WSL is mounted inside the container, so any code you create is accessible both in WSL and in Docker.  
- GUI tools (`rviz`, `rqt`) should work via **WSLg** without additional X server setup.
