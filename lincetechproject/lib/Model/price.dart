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

  ///Function to set List taking of database
  Price.fromDatabaseRowOut(Map<String, Object?> row)
      : parkingLane = row['PARKING_LANE'] as String,
        price = row['PRICE'] as double,
        initialRange = row['INITIAL_RANGE'] as int,
        endRange = row['END_RANGE'] as int;
}
