Ballerina extension quickstart template.

# Module Overview

This is a external function module for Ballerina, which you can use as a sample to build your own ballerina `external` functions.

**Template:** [https://github.com/ldclakmal/ballerina-extension-quickstart](https://github.com/ldclakmal/ballerina-extension-quickstart)

## Compatibility

|                      |           Version           |
|:--------------------:|:---------------------------:|
| Ballerina Language   |            1.1.0            |

## Getting Started

### Prerequisites

Download and install [Ballerina](https://ballerina.io/downloads/).

### Pull the Module

You can pull the SAMPLE module from Ballerina Central using the command:

```shell script
$ ballerina pull ldclakmal/sample
```

## Sample

```ballerina
import ballerina/io;
import ldclakmal/sample;

public function main() {
    int max = sample:max(2, 3);
    io:println(max);
}
```
