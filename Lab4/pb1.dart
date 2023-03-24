//Write a function that receives as parameter a string and a 
// list of regular expressions and returns a list of strings 
// that match at least one regular expression.

List<String> matchFromList(String s, List<String> regExps)
{
    List<String> matches = [];
    for(var exp in regExps){
        final rexp = RegExp(exp);
        Iterable<Match> matchesIt = rexp.allMatches(s);
        for(var str in matchesIt){
            String match = str[0]!;
            matches.insert(matches.length, match);
        }
    }
    return matches;
}

void main()
{
    String s = "aaau vtk lll tu";
    List<String> regexExpressions = [
        r'\w*u\b', // words ending in "u"
        r'\w*[aeiou]\w*' // words containing at least one vowel
    ];
    List<String> matches = matchFromList(s, regexExpressions);
    print("Matches found: $matches");
}