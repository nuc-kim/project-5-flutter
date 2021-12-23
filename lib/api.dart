import 'package:http/http.dart' as http;

class Api {
  static const _originAddress = 'http://jamjam.hopto.org:4088';

  static Future<http.Response> callApi(String url){

      return http.get(Uri.parse(_originAddress + url));
  }
}