class TestResult
{
    int runCount;

    this()
    {
    }

    void testStarted()
    {
        ++runCount;
    }

    string summary()
    {
        return "1 run, 0 failed";
    }
}
