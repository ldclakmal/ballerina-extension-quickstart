import ballerinax/java;

public function max(int a, int b) returns int = @java:Method{
    name: "max",
    class: "lk.avix.sample.Max"
} external;
