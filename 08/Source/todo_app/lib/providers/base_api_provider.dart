import 'package:http/http.dart';
import 'package:http/http.dart' as http;
import 'package:todo_app/providers/api_constants.dart';


class BaseApiProvider {
  Future<Response> get(url) {
    var uri = Uri.parse(url);

    return http.get(
      uri,
      headers: { "X-API-KEY" : APIConstants.API_KEY },
    );
  }

  Future<Response> post(url, data){
    var uri = Uri.parse(url);
    return http.post(uri,
      headers: {
        "X-API-KEY": APIConstants.API_KEY,
        "content-type": 'application/json',
      },
      body: data,
    );
  }

  Future<Response> put(url, data){
    var uri = Uri.parse(url);
    return http.put(uri,
      headers: {
        "X-API-KEY": APIConstants.API_KEY,
        "content-type": 'application/json',
      },
      body: data,
    );
  }

  Future<Response> delete(url){
    var uri = Uri.parse(url);
    return http.delete(uri,
      headers: {
        "X-API-KEY": APIConstants.API_KEY,
        "content-type": 'application/json',
      },
    );
  }
}
