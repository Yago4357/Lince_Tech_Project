///Price model
class Price {

  ///The sector of the price
  final String _parkingLane;

  ///The price of the stay
  final double _priceP;

  ///Initial hour and end hour of the price
  final int _initialRange, _endRange;

  ///Constructor of price model
  Price(this._parkingLane, this._priceP, this._initialRange, this._endRange);

  ///Function to set List of prices taking of database
  Price.fromDatabaseRowOut(Map<String, Object?> row)
      : _parkingLane = row['PARKING_LANE'] as String,
        _priceP = row['PRICE'] as double,
        _initialRange = row['INITIAL_RANGE'] as int,
        _endRange = row['END_RANGE'] as int;


  ///Getter of price parking lane
  String get parkingLane => _parkingLane;

  ///Getter of price parking lane
  double get priceP => _priceP;

  ///Getter of initial range parking lane
  int get initialRange => _initialRange;

  ///Getter of end range parking lane
  int get endRange => _endRange;
}
