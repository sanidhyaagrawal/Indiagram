import 'dart:async';
import 'dart:convert';
//import 'package:http/http.dart' as http;
import 'package:dio/dio.dart';
import 'package:Indiagram/modal/api_model.dart';

final _base = "https://0c2d7c9b398a.ngrok.io"; //server link
final _tokenEndpoint = "/apis/v1/login/";
final _tokenURL = _base + _tokenEndpoint;

Future<Token> getToken(UserLogin userLogin) async {
  print(_tokenURL);
  var dio = Dio();

  final Response response = await dio.post(
    _tokenURL,
    /*headers: <String, String>{
      'Content-Type': 'application/json; charset=UTF-8',
    },
    body: jsonEncode(userLogin.toDatabaseJson()),*/
    options: Options(headers: {
      Headers.contentTypeHeader: "application/json; charset=UTF-8",
    }),
    data: jsonEncode(userLogin.toDatabaseJson()),
  );
  if (response.statusCode == 200) {
    print(response.statusCode);
    print(response.statusMessage);
    print(json.decode(response.data).toString());
    print(json.decode(response.data).toString());
    print(json.decode(response.data).toString());
    return Token.fromJson(json.decode(response.data));
  } else {
    print(response.statusCode);
    print(response.statusMessage);
    print(json.decode(response.data).toString());
    throw Exception(json.decode(response.data));
  }
}
