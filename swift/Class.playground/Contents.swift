import Foundation

// classes are reference type

// Unlike value types, reference types are not copied when they’re assigned to a variable or constant, or when they’re passed to a function. Rather than a copy, a reference to the same existing instance is used.

struct match
{
    var score : Int = 455
    var team1 : String = "India"
    var team2 : String = "Australia"
}

class Series
{
    var matches = match()
    var seriesName : String = "Border Gavaskar Test"
    var venue = "Melbourne"
    var year = "2012"
}

let series1 = Series()
series1.matches.score = 500
series1.seriesName = "World Cup"
series1.venue = "London"

let series2 = series1
series2.matches.score = 100
series2.seriesName = "ICC World Cup 2023"

print(series1.seriesName)


// Very Imp Note : Note that series1 and series2 are declared as constants, rather than variables. However, you can still change series1.frameRate and series2.frameRate because the values of the series1 and series2 constants themselves don’t actually change. series1 and series2 themselves don’t “store” the Series instance — instead, they both refer to a Series instance behind the scenes. It’s the frameRate property of the underlying Series that’s changed, not the values of the constant references to that Series.
