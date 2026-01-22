FROM ros:noetic-ros-core

# Définir apt en mode non interactif
ENV DEBIAN_FRONTEND=noninteractive

# Installer ROS desktop-full et autres outils sans blocage interactif
RUN apt-get update && apt-get install -y \
    ros-noetic-desktop-full \
    python3-rosdep \
    python3-rosinstall \
    python3-rosinstall-generator \
    python3-wstool \
    build-essential \
    locales \
    nano \
    vim \
    && rm -rf /var/lib/apt/lists/*

# Initialiser rosdep
RUN rosdep init && rosdep update

# Configurer l'environnement ROS
SHELL ["/bin/bash", "-c"]
RUN echo "source /opt/ros/noetic/setup.bash" >> ~/.bashrc

# Configurer la locale pour éviter les warnings
RUN locale-gen en_US.UTF-8
ENV LANG en_US.UTF-8
ENV LC_ALL en_US.UTF-8