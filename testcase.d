import std.typetuple;

import testresult;

class TestCase(T)
{
    string name;

    this(string name)
    {
        this.name = name;
    }

    void setUp()
    {
    }

    void tearDown()
    {
    }

    TestResult run()
    {
        auto result = new TestResult();
        result.testStarted();
        this.setUp();

        // Much black magic here. Thanks to @Biotronic for the help!
        alias members = TypeTuple!(__traits(allMembers, T));
        foreach ( member; members )
        {
            static if ( __traits(compiles, __traits(getMember, cast(T)this, member)()) )
            {
                if (member == this.name)
                {
                    __traits(getMember, cast(T)this, member)();
                    break;
                }
            }
        }

        this.tearDown();

        return result;
    }
}
