(* 
*  Timothy Nicholas
*  Marth 16th, 2023
*  palindromeValidation.sml
*  This will make a function that takes a string and test if it's a plaindrome. 
*)

(* This will take a list and reverse it *)
fun reverseList nil = nil (* Null Case *)
  (* Base Case *)
  | reverseList([a]) = [a]
  (* Recursive Case *)
  | reverseList(first::rest) = reverseList(rest)@[first];

(* Checks to see if the symbol is alphabetic by using the ascii table. *)
fun isAlphabetic(chr) = (chr >= #"a" andalso chr <= #"z") 
orelse (chr >= #"A" andalso chr <= #"Z");

(* This will take a character list and remove all non-alphabetic characters*)
fun removeNonAlphabetic(nil) = nil (* Null Case *)
  (* Base Case: If a is aplhabetic, then return it as a list by itself.
  * Otherwise, return a empty list. *)
  | removeNonAlphabetic([a]) = if isAlphabetic(a) then [a] else nil  
  (* Recursive Case *)
  | removeNonAlphabetic(first::rest) = 
  (* If first is not alphabetic, then we remove it from the list. Repeat until
  * we go down the whole list and reach the base case. *)
  if isAlphabetic(first) 
  then first::removeNonAlphabetic(rest) 
  else removeNonAlphabetic(rest);

(* This will take a letter and convert to lower case using the ascii table. *)
fun convertToLowerCase(letter) = chr(ord(letter) + 32);

(* This will take a list and convert each character to lower case letters. *)
fun listToLowerCase(nil) = nil (* Null Case *)
  (* Base Case: If the letter is between A and Z, then convert it into lowercase
  * before sending it in a list by itself. *)
  | listToLowerCase([letter]) = if letter >= #"A" andalso letter <= #"Z" then
    convertToLowerCase(letter)::[] else [letter]
  (* Recursive Case *)
  | listToLowerCase(first::rest) = 
        (* If first is between A and Z, then convert it to lowercase. *)
        if first >= #"A" andalso first <= #"Z" 
        then convertToLowerCase(first)::listToLowerCase(rest)
        else first::listToLowerCase(rest);

(* Returns the last element of a list *)
fun getLast nil = #" " (* Null Case *)
  (* Base Case *)
  | getLast [a] = a
  (* Recursive Case *)
  | getLast(_::rest) = getLast(rest);

(* Takes a list and removes the last element from it. *)
fun removeLast nil = nil (* Null Case *)
  (* Base Case *)
  | removeLast [a] = nil
  (* Recursive Case *)
  | removeLast(first::rest) = first::removeLast(rest);

(* Takes a list and removes the first element form it. *)
fun removeFirst nil = nil
  | removeFirst [a] = nil
  | removeFirst(_::rest) = rest;

(* Takes a character list and converts it into a string. replacement implode. *)
fun myimplode nil = "" (* Null Case *)
  (* Base Case *)
  | myimplode [a] = str(a)
  (* Recursive Case *)
  | myimplode(first::rest) = str(first) ^ myimplode(rest);

(* Takes a string and returns true if it's a palindrome and false otherwise. *)
fun is_palindrome phrase = 
 let
   (* Results in a char list valid for testing whether it's a palindrome.
   * First we convert the phrase into a char list, then we remove all
   * non-alphabetic characters, lastly we convert everything into lower case. *)
   val charList = listToLowerCase(removeNonAlphabetic(explode(phrase)))
   (* Gets the reverse of the char list to compare with. *)
   val reversed = reverseList(charList)
 in
   (* Base Case: A null list is a palindrome by default. *)
   if null(charList) then true 
   (* Recursive Case: Compare the last character of charList with it's reverse. *)
   else getLast(charList) = getLast(reversed) 
   (* Continue down all the layers of characters to verify that it's all valid. *)
   andalso is_palindrome(myimplode(removeFirst(removeLast(charList))))
 end

