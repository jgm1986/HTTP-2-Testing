# HTTP-2-Testing
HTTP/2 testing tools and templates.


### Version
0.0.1


### Installation

You need Git installed on your computer:


```sh
$ sudo apt-get install git
```

This project doesn't need installation. Only clone it on your computer:

```sh
$ git clone https://github.com/jgm1986/HTTP2-Testing.git http2-testing
$ cd http2-testing
```


### Content

This repository is organized under directories according with the content:

```
/
|
├───clients/          # Testing clients installation.
|
└───tests/
    │   README.md:    # This file contains the description of the tests.
    │
    ├───templates/    # Contains the templates for the HTTP/2 Web server.
    │
    └───scripts/      # Bash scripts for test automatization.
        |
        ├───h2/       # HTTP/2 scripts (for https:// URLs).
        │
        └───h2c/      # HTTP/2 Clear Text scripts (for http:// URLs).
```


### Tests

This repository contains a lot of tests for HTTP/2. The description about these tests are inside tests/README.md file. You can access to this file directly clicking [here](tests/README.md).


### Todo's

 - Test Bash Scripts
 - Web Templates
 - Clients installers


License
----

MIT
