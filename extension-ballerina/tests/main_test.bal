import ballerina/test;

@test:Config {}
isolated function testMax() {
    int maxNo = max(1, 2);
    test:assertEquals(maxNo, 2, msg = "Failed!");
}
