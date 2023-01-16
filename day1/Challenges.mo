public query func greet(name : Text) : async Text {
  return "Hello, " # name # "!";
};

// multiply
public query func multiply(n : Nat, m : Nat) : async Nat {
  return n * m;
};

// volume
public query func volume(n : Nat) : async Nat {
  return n ** 3;
};

// hours to minutes
public query func hours_to_minutes(n : Nat) : async Nat {
  return n * 60;
};

// counter setter
public func set_counter(n : Nat) : async () {
  counter := n;
};

// counter getter
public query func get_counter() : async Nat {
  return counter;
};

// test divide
public query func test_divide(n : Nat, m : Nat) : async Bool {
  if (n / m != 0) {
    return true;
  } else {
    return false;
  };
};

// even number checker
public query func is_even(n : Nat) : async Bool {
  if (n % 2 == 0) {
    return true;
  } else {
    return false;
  };
};
