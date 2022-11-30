///Price model
class Price {

  ///The sector of the price
  String parkingLane;

  ///The price of the stay
  double price;

  ///Initial hour and end hour of the price
  int initialRange, endRange;

  ///Constructor of price model
  Price(this.parkingLane, this.price, this.initialRange, this.endRange);
}
