import testcase;

class WasRun : TestCase!WasRun
{
    bool wasRun;
    string log;

    this(string name)
    {
        super(name);
    }

    override void setUp()
    {
        log = "setUp ";
    }

    override void tearDown()
    {
        log ~= "tearDown ";
    }

    void testMethod()
    {
        wasRun = true;
        log ~= "testMethod ";
    }

    void testBrokenMethod()
    {
        //throw new Exception("test exception");
    }
}
