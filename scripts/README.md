# HTTP/2 - Testing Framework Script

## Requirements

This script use [NGHTTP2](https://nghttp2.org/) client for make the HTTP/2 tests. If this client is not present on your system, you can use the installation script from this repository under "clients" directory.


## How it works?

The main functionality of this script is load the list of tests defined on "tests.list" directories and launch all of them sequentially. 

You can launch the tests using the following command:

```sh
$ ./run_tests.sh 1000
```

You have to define the amount number that each test will be executed as input parameter. On the previous line, the script repeats each HTTP/2 test 1000 times.

The results of the tests, will be saved under "results" directory. The name of the output file, is defined on "test.list" file individually for each test.

It is possible launch the tests on second plane and saving the output to an external file is using:

```sh
$ nohup ./run_tests.sh 1000 > testsOutput.log &
```


## Config file

You have to customize the test script configuration file using a text editor before start. For example:

```sh
$ sudo nano config.conf
```

Each field on this configuration file is described inside the file. 


## Test list file

All tests to be executed by this script, must be defined inside "test.list" file. You can edit using this command:

```sh
$ sudo nano test.list
```

The only way for defined a test is using four arrays with the same index. These arrays are the following:

- **TestName:** Contains the route to the template file from the remote test server.
- **TestFilename:** Set the name for the output where the test results will be saved.
- **TestParameter:** Define the input options for NGHTTP client. For get more info about all possibilities, please click [here](https://nghttp2.org/documentation/nghttp.1.html#options).
- **TestTimeOut:** This parameter is used to define the maximum time to finish the current test before timeout. NGHTTP2 Client generate an error if this value is exceed.
- **TestUrlPreamb:** Define if the test use *http://* or *https://* with URL of the test server.

This is an example of test definition:

```bash
TestName=(${TestName[@]} "/test/test_01.html")
TestFilename=(${TestFilename[@]} "h2c_Performance_01_$NUM_REPETI.dat")
TestParameter=(${TestParameter[@]} "-uvnas")
TestUrlPreamb=(${TestUrlPreamb[@]} "http://")
```

The user only have to modify the values between double quotes for defined or customize a test.

**WARNING:** The rest of the code inside test.list file must be the same without changes.

## Useful Commands

This list shows some useful commands for this toolkit.

- Show the errors produced during the tests: **cat file.log | grep ERROR**
