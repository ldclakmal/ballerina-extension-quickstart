[![Build Status](https://api.travis-ci.com/ldclakmal/sample-ballerina-extension.svg?branch=master)](https://travis-ci.com/ldclakmal/sample-ballerina-extension)

# Ballerina Extension

This is a external function module for Ballerina, which you can use as a sample to build your own ballerina `extern` functions.

## Steps to Configure

Extract `ballerina-extension-<version>.zip` and  Run the `install.sh` script to install the module.
You can uninstall the module by running `uninstall.sh`.

## Building From the Source

If you want to build Ballerina Extension module from the source code:

1. Get a clone or download the source from this repository: https://github.com/ldclakmal/nsample-ballerina-extension.git
2. Run the following Maven command from the ballerina directory: `mvn clean install`
3. Extract the distribution created at `/component/target/ballerina-extension-<version>.zip`. Run the `install.{sh/bat}` script to install the module. You can uninstall the module by running `uninstall.{sh/bat}`.

## Sample

```ballerina
import ballerina/io;
import wso2/extension;

public function main() {
    int max = extension:max(2, 3);
    io:println(max);
}
```
