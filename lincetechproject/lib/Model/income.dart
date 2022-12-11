///Model to set the variables of object Income
class Income {

  ///Variable to set data income
  final String data;

  ///Variable to set the income per day
  final double incomeDay;

  ///Constructor for income per day
  Income(this.data, this.incomeDay);

  ///Function to set List of incomes taking of database
  Income.fromDatabaseRowOut(Map<String, Object?> row)
  : data = row['EXIT_DATE'] as String,
    incomeDay = row['sum(TOTAL_PRICE)'] as double;

}