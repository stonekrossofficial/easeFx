import 'package:http/http.dart' as http;

class ApiClient {
  final http.Client _client = http.Client();
  final String baseUrl;

  ApiClient({this.baseUrl = ""}); // TODO: Inject real URL

}
