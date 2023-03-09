//a
class Client{
  final String Name; // can't be changed
  double PurchasesAmount = 0;

  Client(this.Name); //b
  void add(double value) { PurchasesAmount += value; }
  double get purchasesAmount { return PurchasesAmount; }
}

//c
class LoyalClient extends Client{
  double _PurchasesAmount = 0;

  LoyalClient(super.Name);

  double get loyalPurchasesAmount { return _PurchasesAmount; }

  //d
  void discount(){ 
    this._PurchasesAmount = super.PurchasesAmount - super.PurchasesAmount * 0.1; 
  }
  
}

//e
void main(){
  var newClient = Client("Alex");
  newClient.add(150.50);
  newClient.add(200);
  print("Client ${newClient.Name} "
        "has made purchases worth ${newClient.purchasesAmount}");
  var newLoyalClient = LoyalClient("David");
  newLoyalClient.add(300);
  newLoyalClient.add(235.25);
  print("Client ${newLoyalClient.Name} "
        "has made purchases worth ${newLoyalClient.purchasesAmount}");
  newLoyalClient.discount();
  print("Applied a 10% discount to loyal client ${newLoyalClient.Name}"
        " -> ${newLoyalClient.loyalPurchasesAmount}");

}