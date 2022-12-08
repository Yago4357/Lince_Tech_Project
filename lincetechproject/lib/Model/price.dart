///Price model
class Price {

  ///The sector of the price
  String _parkingLane;

  ///The price of the stay
  double _priceP;

  ///Initial hour and end hour of the price
  int _initialRange, _endRange;

  ///Constructor of price model
  Price(this._parkingLane, this._priceP, this._initialRange, this._endRange);

  ///Function to set List taking of database
  Price.fromDatabaseRowOut(Map<String, Object?> row)
      : _parkingLane = row['PARKING_LANE'] as String,
        _priceP = row['PRICE'] as double,
        _initialRange = row['INITIAL_RANGE'] as int,
        _endRange = row['END_RANGE'] as int;


  String get parkingLane => _parkingLane;

  double get priceP => _priceP;

  int get initialRange => _initialRange;

  int get endRange => _endRange;
}
