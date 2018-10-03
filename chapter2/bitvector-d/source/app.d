import core.bitop;
import std.stdio;
import std.traits;

extern (C)
{
    ulong select1(ulong x, ulong i);
}

T rank1(T)(T x, size_t i)
    if (isIntegral!T)
{
    enum T bits = T.sizeof * 8;
    T z = x << (bits - i);
    return popcnt(z);
}

void main()
{
    immutable ulong X = 0b00110011_00110011_00110011_00110011;

    foreach (i; 1 .. ulong.sizeof + 1)
        writefln("%d %d", i, rank1(X, i));

    foreach (i; 1 .. ulong.sizeof + 1)
        writefln("%d %d", i, select1(X, i));
}
