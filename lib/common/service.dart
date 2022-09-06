import 'package:http/http.dart' as http;

class HttpService {
  static String baseUrl = '';

  static Future<http.Response> getRequest() async {
    http.Response response;

    final url = Uri.parse(baseUrl);

    try {
      response = await http.get(url);
    } on Exception {
      rethrow;
    }

    return response;
  }
}
