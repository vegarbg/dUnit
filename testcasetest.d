import testcase;
import wasrun;

class TestCaseTest : TestCase!TestCaseTest
{
    this(string name)
    {
        super(name);
    }

    void testTemplateMethod()
    {
        auto test = new WasRun("testMethod");
        auto result = test.run();
        assert("setUp testMethod tearDown " == test.log);
        assert("1 run, 0 failed" == result.summary());
    }

    void testFailedResult()
    {
        auto test = new WasRun("testBrokenMethod");
        auto result = test.run();
        assert("1 run, 1 failed" == result.summary());
    }
}
