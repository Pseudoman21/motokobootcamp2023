import Nat "mo:base/Nat";
import Text "mo:base/Text";
import Char "mo:base/Char";
import Array "mo:base/Array";
import Debug "mo:base/Debug";
import Iter "mo:base/Iter";
import Buffer "mo:base/Buffer";

actor {
  // average
  public func average_array(array : [Int]) : async Int {
    var total : Int = 0;
    for (value in array.vals()) {
      total := total + value;
    };
    return total / array.size();
  };

  // counting the characters
  public func count_character(t : Text, c : Char) : async Nat {
    var numberOfChars : Nat = 0;
    for (char in t.chars()) {
      if (Char.toText(char) == Char.toText(c)) {
        numberOfChars := numberOfChars + 1;
      };
    };
    return numberOfChars;
  };

  // factorial
  public query func factorial(n : Nat) : async Nat {
    if (n == 0) {
      return 0;
    };

    var counter : Nat = 1;
    let index = Iter.range(1, n);

    for (number in index) {
      counter := counter * number;
    };
    return counter;
  };

  // counting number of words from a sentence
  public query func number_of_words(t : Text): async Nat {
    var counter : Nat = 0; 
    type Pattern = Text.Pattern;
    let pattern: Pattern = #char(' ');
    var i = Text.split(t, pattern);

    for(words in i){
      counter := counter + 1;
    };
    return counter;
  };
};
