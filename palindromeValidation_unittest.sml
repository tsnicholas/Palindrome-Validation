(* Tests palindromeValidation.sml *)

val now = "Testing Reverse List...";
reverseList([]) = nil;
reverseList([#"A"]) = [#"A"];
reverseList([#"T", #"!", #"m"]) = [#"m", #"!", #"T"];

val now = "Testing List To Lower Case...";
listToLowerCase([]) = nil;
listToLowerCase([#"a"]) = [#"a"];
listToLowerCase([#"J", #"a", #"V", #"@"]) = [#"j", #"a", #"v", #"@"];

val now = "Testing remove non-alphabetic...";
removeNonAlphabetic([]) = nil;
removeNonAlphabetic([#"a"]) = [#"a"];
removeNonAlphabetic([#"2", #"p", #"&", #"j"]) = [#"p", #"j"];

val now = "Testing get last...";
getLast([#"a"]) = #"a";
getLast([#"m", #"i", #"k", #"e"]) = #"e";

val now = "Testing remove last...";
removeLast([]) = nil;
removeLast([1]) = nil;
removeLast([1, 2, 3, 4]) = [1, 2, 3];
removeLast([#"w", #"o", #"w"]) = [#"w", #"o"];

val now = "Testing remove first...";
removeFirst([]) = nil;
removeFirst([1]) = nil;
removeFirst([1, 2, 3, 4]) = [2, 3, 4];
removeFirst([#"w", #"o", #"w"]) = [#"o", #"w"];

val now = "Testing is palindrome...";
is_palindrome("a") = true;
is_palindrome("ab") = false;
is_palindrome("wow") = true;
is_palindrome("Hannah!") = true;
is_palindrome("A man, a plan, a canal - Panama!") = true;
is_palindrome("Able was I ere I saw Elba.") = true;
is_palindrome("Tim Nicholas") = false;
is_palindrome("ML is the best language!") = false;

