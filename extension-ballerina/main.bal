import ballerina/jballerina.java;

public isolated function max(int a, int b) returns int = @java:Method {
    name: "max",
    'class: "lk.avix.nativeimpl.Max"
} external;
