import ballerina/io;
import ballerina/test;

# Before Suite Function
@test:BeforeSuite
function beforeSuiteFunc() {
    io:println("I'm the before suite function!");
}

# Before test function
function beforeFunc() {
    io:println("I'm the before function!");
}

# Test function
@test:Config {
    before: beforeFunc,
    after: afterFunc
}
function testFunction() {
    io:println("I'm in test function!");
    int maxNo = max(1, 2);
    test:assertEquals(maxNo, 2, msg = "Failed!");
}

# After test function
function afterFunc() {
    io:println("I'm the after function!");
}

# After Suite Function
@test:AfterSuite {}
function afterSuiteFunc() {
    io:println("I'm the after suite function!");
}
