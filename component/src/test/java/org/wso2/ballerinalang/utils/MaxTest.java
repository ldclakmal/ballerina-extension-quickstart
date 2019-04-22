/*
 * Copyright (c) 2019, WSO2 Inc. (http://www.wso2.org) All Rights Reserved.
 *
 * WSO2 Inc. licenses this file to you under the Apache License,
 * Version 2.0 (the "License"); you may not use this file except
 * in compliance with the License.
 * You may obtain a copy of the License at
 *
 *    http://www.apache.org/licenses/LICENSE-2.0
 *
 * Unless required by applicable law or agreed to in writing,
 * software distributed under the License is distributed on an
 * "AS IS" BASIS, WITHOUT WARRANTIES OR CONDITIONS OF ANY
 * KIND, either express or implied.  See the License for the
 * specific language governing permissions and limitations
 * under the License.
 */
package org.wso2.ballerinalang.utils;

import org.ballerinalang.launcher.util.BCompileUtil;
import org.ballerinalang.launcher.util.BRunUtil;
import org.ballerinalang.launcher.util.CompileResult;
import org.ballerinalang.model.values.BInteger;
import org.ballerinalang.model.values.BValue;
import org.testng.Assert;
import org.testng.annotations.BeforeClass;
import org.testng.annotations.Test;

/**
 * Native function to test org.wso2.ballerina.utils:max.
 */
public class MaxTest {

    private CompileResult result;

    @BeforeClass
    public void setup() {
        result = BCompileUtil.compile("samples/max.bal");
    }

    @Test(description = "Tests max util")
    public void testMax1() {
        BValue[] results = BRunUtil.invoke(result, "testMax1");
        Assert.assertEquals(((BInteger) results[0]).intValue(), 2);
    }

    @Test(description = "Tests max util")
    public void testMax2() {
        BValue[] results = BRunUtil.invoke(result, "testMax2");
        Assert.assertEquals(((BInteger) results[0]).intValue(), 10);
    }

    @Test(description = "Tests max util")
    public void testMax3() {
        BValue[] results = BRunUtil.invoke(result, "testMax3");
        Assert.assertEquals(((BInteger) results[0]).intValue(), 2);
    }
}
