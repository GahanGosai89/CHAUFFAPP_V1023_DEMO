class DemoModel{

//These are the values that this Demo model can store
  double number1 = 0.0;
  double number2 = 0.0;

//default Constructor
  DemoModel(double num1,double num2){
    this.number1 = num1;
    this.number2 = num2;
  }

//We added some functionality to our model
  getLat(){
    return number1;
  }
  getLng(){
    return number2;
  }

}