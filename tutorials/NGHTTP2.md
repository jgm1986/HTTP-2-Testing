# HTTP/2 Client: *NGHTTP2*

## How to install?

The main client used for HTTP/2 Tests is [NGHTTP2](http://nghttp2.org). This package required some dependencies but, we have deployed an installation script for make it easy on [this repository](https://github.com/jgm1986/HTTP2-Testing/tree/master/clients). There are more info about the installation process on the README.md file.

## How to use this client?

There are several input parameters for this client but I only explain the most useful for our tests:

### · https://URLs *(h2)*

This command allow open an h2 session for get the test template number 1 from our public test server.

```sh
$ nghttp -vnas https://testhttp2.bluevia.com/test/test_01.html
```

- **v:** Verbose mode.
- **n:** Discard downloaded data.
- **a:** Download assets such as CSS, images...
- **s:** Statistics.

### · http://URLs *(h2c Upgrade)*

The easy way to get the same test page but using HTTP/2 Clear Text is using this:

```sh
$ nghttp -vunas http://testhttp2.bluevia.com/test/test_01.html
```

- **v:** Verbose mode.
- **u:** Perform HTTP Upgrade for HTTP/2.
- **n:** Discard downloaded data.
- **a:** Download assets such as CSS, images...
- **s:** Statistics.

### · http://URLs *(h2c)*

The direct mode is not defined in to HTTP/2 specification document but is used by developers. The way to use this mode with our server URL is:

```sh
$ nghttp -vnas http://testhttp2.bluevia.com/test/test_01.html
```

- **v:** Verbose mode.
- **u:** Perform HTTP Upgrade for HTTP/2.
- **n:** Discard downloaded data.
- **a:** Download assets such as CSS, images...
- **s:** Statistics.