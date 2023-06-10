import Debug "mo:base/Debug";
import Time "mo:base/Time";
import Float "mo:base/Float";


actor DBank{
  stable var currentValue: Float = 300; //Declare variable
  // With stable, you can kept the value of the variable even if you deploy 
  // currentValue:= 100; // change the value

  let id = 123843465; // let creates constants 

  // Create a time variable 
  stable var startTime = Time.now();
  // Debug.print(debug_show(startTime));

  // Debug.print(debug_show(currentValue));
  // func topUp() { // This is a private function for the actor
  //   currentValue += 1;
  //   Debug.print(debug_show(currentValue));
  // };

  public func topUp(amount: Float) { // This is a private function for the actor
    currentValue += amount;
    Debug.print(debug_show(currentValue));
  };

  public func withdrawl(amount: Float) {
    let tempValue: Float = currentValue - amount;
    if (tempValue >= 0 ){
      currentValue -= amount;
      Debug.print(debug_show(currentValue));
    //Handle conditions:
    }
    else {
      Debug.print("There is a problem subtracting");
    }
  };

  public query func checkBalance(): async Float {
    return currentValue;
  };  


  public func compound() {
    let currentTime = Time.now();
    let timeElapsedNS = currentTime - startTime; //Time in nano seconds
    let timeElapsedS = timeElapsedNS / 1000000000; //Time seconds 
    currentValue := currentValue * (1.01 ** Float.fromInt(timeElapsedS));
    startTime := currentTime;
  };

}