# HTTP/2 Test Reults Analysis

This tools provides an easy way to get statistical parameters using test results files. By the moment these are the calculated parameters:

- **Cumulative Mean:** Evolution of the mean value along each test sample result. Used to view the mean stabilisation of value along the time.
- **Mean:** Last value of cumulative mean evolution.
- **Typical deviation.**


## How to use?

You must follow the following steps:

1. Launch the installation script if it's the first time that you are using this tool.
2. Put all test results files inside "data" directory.
3. Launch the cumulative mean calculator script.
4. Launch the statistical parameters calculator. The calculated values are shown under standard output.

### Installation script:

This tool is used to make the basic directory structure for the statistics tools. Run it only if it's the first time that you are using this tool.

```sh
$ ./install.sh
```

### Cumulative mean calculator:

This script should be executed with the following command:

```sh
$ ./cumulat_mean.sh
```

The output files are stored under "mean" directory with its graph representation.

### Statistical parameters calculator:

This script should be executed with the following command:

```sh
$ python statistics.py
```
