1. How much is the current memory capacity of a canister?
2. What is the issue with the following code sample?
actor {
  let counter : Nat = 0;
  public func increment_counter() : async () {
    counter := counter + 1;
  };
}

Answer:
It is reassigning to a immutable variable.

3. What is the issue with the following code sample?
actor {
  var message : Text = 0;

  public query func change_message(new_message : Text) : async () {
    message := new_message;
    return;
  };
  
  public query func see_message() : async Text {
    return(message);
  };
}

Answer:
Returns a type text but the value of message is a Natural number or Nat.

4. False or True: we can remove the keyword async for return argument of a query function since queries are faster to answer.
Answer: False
