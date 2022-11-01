#!/bin/bash

# Generate Root CA key and pem
openssl req -x509 -nodes -new -sha256 -days 20000 -newkey rsa:2048 -keyout RootCA.key -out RootCA.pem -subj "/C=US/CN=Example-Root-CA"
# Generate Root CA cert
openssl x509 -outform pem -in RootCA.pem -extfile ./localhost_openssl.conf -extensions req_ext -out RootCA.crt


# localhost csr and key
openssl req -new -nodes -newkey rsa:2048 -keyout localhost.key -out localhost.csr -subj "/C=US/ST=YourState/L=YourCity/O=Example-Certificates/CN=localhost.local"
# localhost cert
openssl x509 -req -sha256 -days 20000 -in localhost.csr -CA RootCA.pem -CAkey RootCA.key -CAcreateserial -out localhost.crt
