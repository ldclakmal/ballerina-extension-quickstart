# Ballerina Extension Quickstart

[![Build](https://github.com/ldclakmal/ballerina-extension-quickstart/actions/workflows/master.yml/badge.svg)](https://github.com/ldclakmal/ballerina-extension-quickstart/actions/workflows/master.yml)

This is a sample Ballerina extension for demonstration purpose, which you can use as a sample to build your own ballerina `external` functions.

**Template:** [https://github.com/ldclakmal/ballerina-extension-quickstart](https://github.com/ldclakmal/ballerina-extension-quickstart)

## Compatibility

|                            | **Version**       |
|----------------------------|-------------------|
| Ballerina Language         | Swan Lake Alpha 1 |
| Java Development Kit (JDK) | 11                |

## Getting started

1. Refer to the [Quick Tour](https://ballerina.io/learn/getting-started/quick-tour/) guide to download and install Ballerina.
2. Clone the [ballerina-connector-quickstart](https://github.com/ldclakmal/ballerina-connector-quickstart) GitHub repository.
3. Move inside to `ballerina-extension-quickstart` directory and execute `$ ./gradlew build`. It should compile the source, run the tests and generates the executables.

## Samples

Import the `ldclakmal/extension` module into your Ballerina project and check the usage of sample `max` function.

```ballerina
import ballerina/io;
import ldclakmal/extension;

public function main() {
    int maxNo = extension:max(2, 10);
    io:println(maxNo);
}
```
