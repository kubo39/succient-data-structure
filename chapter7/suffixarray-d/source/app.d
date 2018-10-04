import std.algorithm : map, sort;
import std.array : array;
import std.range : iota;
import std.typecons : tuple;
import std.stdio;

size_t[] suffixArray(string document)
{
    return 0.iota(document.length)
        .map!(a => tuple(a, document[a .. $]))
        .array
        .sort!((a, b) => a[1] < b[1])
        .map!(a => a[0])
        .array;
}

size_t binarySearch(size_t[] sa, bool delegate(size_t) del)
{
    size_t left = 0;
    size_t right = sa.length;
    while (left < right)
    {
        auto mid = (left + right) / 2;
        if (del(sa[mid]))
            right = mid;
        else
            left = mid + 1;
    }
    return left;
}

void main()
{
    auto document = "abracadabra";
    auto sa = suffixArray(document);
    writeln(binarySearch(sa, (n) => document[n] > 'c'));
}
