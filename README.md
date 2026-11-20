# Simple Node.js Web Application

This is a basic web application built with Node.js and the Express framework. It is designed primarily for demonstrating how to containerize an application using Docker.

## Prerequisites

Before you begin, ensure you have the following installed on your machine:

*   [Docker Desktop](https://www.docker.com/products/docker-desktop/) (or Docker Engine)

## Getting Started with Docker

These instructions assume you are in the root directory of the project (where the `Dockerfile` is located).

### 1. Build the Docker Image

Run the following command to build the Docker image. We will tag it `webapp`:

```bash
docker build -t webapp .