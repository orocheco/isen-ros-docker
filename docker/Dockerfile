FROM osrf/ros:noetic-desktop-full

# Définir apt en mode non interactif
ENV DEBIAN_FRONTEND=noninteractive
# Utilise bash
SHELL ["/bin/bash", "-c"]

# Installer ROS desktop-full et autres outils sans blocage interactif
RUN apt-get update && apt-get install -y \
    sudo \
    nano \
    vim \
    locales \
    python3-rosdep \
    python3-rosinstall \
    python3-rosinstall-generator \
    python3-wstool \
    build-essential \
    && rm -rf /var/lib/apt/lists/*

# Configurer la locale pour éviter les warnings
RUN locale-gen en_US.UTF-8
ENV LANG en_US.UTF-8
ENV LC_ALL en_US.UTF-8

# Utilisateur ros
ARG USERNAME=rosuser
ARG USER_UID=1000
ARG USER_GID=$USER_UID

RUN groupadd --gid $USER_GID $USERNAME \
    && useradd --uid $USER_UID --gid $USER_GID -m $USERNAME \
    && apt-get update && apt-get install -y sudo \
    && echo "$USERNAME ALL=(ALL) NOPASSWD:ALL" >> /etc/sudoers



# Initialiser rosdep
RUN rosdep init || true 
RUN rosdep update


# ---- Workspace ----
RUN mkdir -p /workspace/catkin_ws/src \
    && chown -R $USERNAME:$USERNAME /workspace


# On switch d'utilisateur (pour ne pas utiliser root) 
USER $USERNAME
WORKDIR /workspace

# Scripts personnalisés
COPY docker/custom_scripts/ /opt/ros/custom/scripts
RUN echo "source /opt/ros/noetic/setup.bash" >> ~/.bashrc && \
    echo "source /opt/ros/custom/scripts/user.bash" >> ~/.bashrc

