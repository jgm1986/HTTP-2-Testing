# HTTP/2 - Testing

This repository contains all necessary for deploy HTTP/2 testing server or clients. The "clients" directory contains the scripts for download and install clients with HTTP 2 support easily. The "tests" folder contains some test templates and bash scripts for test automation. You can get more info in to the README.md file located inside each folder.


## Version

0.4.2


## Installation

You need Git installed on your computer:


```sh
$ sudo apt-get install git
```

This project doesn't need installation. Only clone it on your computer:

```sh
$ git clone https://github.com/jgm1986/HTTP2-Testing.git http2-testing
$ cd http2-testing
```


## Content

This repository is organized under directories according with the content:

```
/
|
├───analysis/       # Scripts to calculate statistical parameters with the tests results.
|   │   README.md   # This file contains info about how to use these tools.
|   |
|   ├───data/    	# Test results output files.
|   |
|   └───mean/    	# Files with cumulative mean for each test samples.
|
├───clients/        # Testing clients installation.
|   |   README.md   # This file contains info about how to use the installation scripts.
|   |
|   └───packages/   # Contains the downloads for dependences and clients.
|   
├───scripts/        # Bash scripts for test automation.
|   │   README.md   # This file contains info about how to configure and launch tests automatically.
|   |
|   └───results/    # The file result of each test will be save under this directory.
|
├───tests/          # Contains the templates for the HTTP/2 Web server.
|   │   README.md   # This file contains the tests description and installation.
|   │
|   └───templates/  # Contains the templates for the HTTP/2 Web server.
|
└───tutorials/      # Basic tutorials about how to use testing tools.
```


## Tests

This repository contains a lot of tests for HTTP/2. The description about these tests are inside tests/README.md file. You can access to this file directly clicking [here](tests/README.md).


## License

[MIT](http://opensource.org/licenses/mit-license.html)
