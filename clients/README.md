# HTTP-2 Clients

This folder contains all necessary for install HTTP/2 clients under Ubuntu 14.04.x LTS (64bits).

## Index of clients
The installation scripts are available for these clients:

- [cURL](http://curl.haxx.se/)
- [NGHTTP2](https://nghttp2.org/)


#### cURL

This script make a cURL installation without user intervention. For be enabled HTTP/2 support on this client, you have to install NGHTTP2 before. If all requirements are satisfied, write this command to install it:

```sh
$ ./curl_installer.sh
```

Please enter  the password of the root user if will be necessary.


#### NGHTTP2

The installation script contains all necessary for complete the installation of NGHTTP2 without user intervention. You only have to run this command:

```sh
$ ./nghttp2_installer.sh
```

Please enter  the password of the root user if will be necessary.


## How to use this clients?

The easy way to meet how to use these clients is defined inside "tutorials" folder from this project.


