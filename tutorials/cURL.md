# HTTP/2 Client: *cURL*

## How to install?

The main client used for HTTP/2 Tests is [cURL](http://curl.haxx.se/). This package required some dependencies but, we have deployed an installation script for make it easy on [this repository](https://github.com/jgm1986/HTTP2-Testing/tree/master/clients). There are more info about the installation process on the README.md file.

## How to use this client?

The binary file of this cURL version is under src/curl inside cURL installation directory.

```
/ # Repository main folder.
|
└───clients/        
    |
    └───packages/
        |
        └───curl/	# cURL installation directory.
```

On the other hand, there are several input parameters for this client but I only explain the most useful for our tests:

### · https://URLs *(h2)*

This command allow open an h2 session for get the test template number 1 from our public test server.

```sh
$ src/curl --verbose --http2 https://testhttp2.bluevia.com/test/test_01.html
```

- **--verbose:** Verbose mode.
- **--http2:** Use HTTP/2 protocol.


### · http://URLs *(h2c Upgrade)*

The easy way to get the same test page but using HTTP/2 Clear Text is using this:

```sh
$ src/curl --verbose --http2 http://testhttp2.bluevia.com/test/test_01.html
```

- **--verbose:** Verbose mode.
- **--http2:** Use HTTP/2 protocol.

### · http://URLs *(h2c)*

Direct mode is not supported on this version of cURL.