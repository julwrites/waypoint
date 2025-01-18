# Use an official Node runtime as the base image
FROM node:22-bookworm-slim

RUN apt-get update && apt-get upgrade -y
RUN apt-get install git -y

# Install pnpm globally
RUN npm install -g pnpm

# Set the working directory in the container
WORKDIR /app

RUN git clone https://github.com/julwrites/waypoint

WORKDIR /app/waypoint

RUN echo "Y_SWEET_CONNECTION_STRING=ys:127.0.0.1:8080" >> .env

RUN make deploy

EXPOSE 8080

ENTRYPOINT ["pnpm", "run", "ysweet"]