# HTTP-2-Testing Framework Script

## Requirements
This script use [NGHTTP2](https://nghttp2.org/) client for make the HTTP/2 tests. If this client is not present on your system, you can use the installation script from this repository under "clients" directory.


## How it works?

The main functionality of this script is load the parametrization test files inside h2 and h2c directories and launch all of them sequentially. 

You can launch the tests using the following command:

```sh
$ ./run_tests.sh 1000
```

You have to define the amount number that each test will be executed as input parameter. On the previous line, the script repeats each HTTP/2 test 1000 times.


## Config file
You have to customize the test script configuration file using a text editor before start. For example:

```sh
$ sudo nano config.conf
```

Each field on this configuration file is described inside the file. 
