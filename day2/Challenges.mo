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

  // duplicate nat element checker in an array
  public query func find_duplicates(a : [Nat]) : async [Nat] {
    var buf = Buffer.Buffer<Nat>(1);    
    for (index in Iter.range(0, a.size() -1)) { // 0 - array size // 2,1,2,3,4,6,6 - a[i=0] = 2
      for (j in Iter.range(index + 1, a.size() - 1)) { // a[j=0] = 1
        if (a[index] == a[j] and not Buffer.contains(buf, a[index], Nat.equal)) { 
          // a[index=0] 2 === a[j=0] 1 ? &&  a[index] is in Buffer buf
          buf.add(a[j]);
        };
      };
    };
    return Buffer.toArray(buf);
  };

  // nat to binary converter
  public query func convert_to_binary(n : Nat) : async Text {
    var binText : Text = "";
    var quo = n;
    while (quo > 0) {
      var rem = quo % 2;
      binText := Nat.toText(rem) # binText;
      quo := quo / 2;
    };
    return binText;
  };
};
