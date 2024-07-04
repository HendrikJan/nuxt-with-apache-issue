FROM node:20.13.1

# Create app directory
WORKDIR /var/app

# Install packages
RUN apt-get update
RUN apt-get install -y nano
RUN apt-get install -y less
RUN apt-get install -y telnet

# Bundle app source
COPY . .

# NodeJS www Server
EXPOSE 3000

# entrypoint
COPY ./docker/nodejs_entrypoint.sh /entrypoint.sh
RUN chmod a+x /entrypoint.sh

# Create a user with UID 1001 in case we neede it
RUN useradd -u 1001 user1001

# Make bash history inside the container work a little better
# Remove duplicates from history
RUN echo "export HISTCONTROL=ignoreboth:erasedups" >> ~/.bashrc
RUN echo "alias menu='bash /var/app/menu.sh'" >> ~/.bashrc
RUN echo "alias m='bash /var/app/menu.sh'" >> ~/.bashrc

# entrypoint
ENTRYPOINT /entrypoint.sh
