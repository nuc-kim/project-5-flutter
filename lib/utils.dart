import 'package:intl/intl.dart';

class Utils{
  static String getPriceNumberFormat(int price){
    var type = NumberFormat("###,###,### 원");
    return type.format(price);
  }
}