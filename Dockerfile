# Uses an older version of Ubuntu that contains known vulnerabilities for Wiz to find
FROM ubuntu:20.04

# A simple command just to simulate adding software to the image
RUN apt-get update && apt-get install -y curl
