import Debug "mo:base/Debug";
import Time "mo:base/Time";
import Float "mo:base/Float";

actor DBank {


   stable var currentValue: Float = 300;
  currentValue := 100;
  Debug.print(debug_show(currentValue));


  //let id = 1234567;
  stable var startTime = Time.now();
  startTime := Time.now();
  Debug.print(debug_show(startTime));

public func topUp(amount: Float){
    currentValue += amount;
    //Debug.print(debug_show(currentValue));

  };

public func withdraw(wdraw: Float){
    let tempValue: Float = currentValue - wdraw;
    if (tempValue >= 0) {
      currentValue -= wdraw;
      Debug.print(debug_show(currentValue));
    }
    else {
      Debug.print("not enough in your acct")
    }
    
};
public query func checkBalance(): async Float {
  return currentValue;

};
public func compound(){
  let currentTime = Time.now();
  let timeElapsedNS = currentTime - startTime;
  let timeElapsedS = timeElapsedNS/1000000000;
  currentValue := currentValue * (1.01 ** Float.fromInt(timeElapsedS));
  Debug.print(debug_show(currentValue));
  startTime := currentTime;
}

}