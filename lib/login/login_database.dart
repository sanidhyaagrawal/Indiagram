import 'dart:async';
import 'dart:io';
import 'package:dio/dio.dart';
import 'package:path/path.dart';
import 'package:path_provider/path_provider.dart';
import 'package:sqflite/sqflite.dart';

final userTable = "Login";
final columnId = "Id";
final columnKey = "Key";
final columnUsername = "Username";

final _base = "http://28e8a2100448.ngrok.io";
final _keyEndpoint = "/apis/v1/login/";
final _keyURL = _base + _keyEndpoint;

Future<Key> getKey(userLogin) async {
  print(_keyURL);
  var dio = Dio();

  final Response response = await dio.post(
    _keyURL,
    options: Options(headers: {
      Headers.contentTypeHeader: "application/json",
    }),
    data: userLogin.toDatabaseJson(),
  );

  if (response.statusCode == 202) {
    print(response.statusCode);
    print(response.statusMessage);
    print(response.data);
    print(response.data);
    print(response.data);
    return Key.fromJson(response.data);
  } else if (response.statusCode == 200) {
    print(response.statusCode);
    print(response.statusMessage);
    print(response.data);
    print(response.data);
    print(response.data);
    return Key.fromJson(response.data);
  } else {
    print(response.statusCode);
    print(response.statusMessage);
    print(response.data);
    throw Exception(response.data);
  }
}

class Key{
  String key;

  Key({this.key});

  factory Key.fromJson(Map<String, String> json) {
    return Key(
      key: json['key']
    );
  }
}


//Database for user login
class DatabaseProvider {
  static final DatabaseProvider dbProvider = DatabaseProvider();

  Database _database;

  Future<Database> get database async {
    if (_database != null) {
      return _database;
    }
    _database = await createDatabase();
    return _database;
  }

  createDatabase() async {
    Directory documentsDirectory = await getApplicationDocumentsDirectory();
    //"User.db is our database instance name
    String path = join(documentsDirectory.path, "User.db");

    var database = await openDatabase(
      path,
      version: 1,
      onCreate: initDB,
      onUpgrade: onUpgrade);
    return database;
  }

  //This is optional, and only used for changing DB schema migrations
  void onUpgrade(Database database, int oldVersion, int newVersion) {
    if (newVersion > oldVersion) {}
  }

  void initDB(Database database, int version) async {
    await database.execute("CREATE TABLE $userTable ("
        /*SQLITE doesn't have boolean type
        so we store isDone as integer where 0 is false
        and 1 is true*/
        "$columnId id INTEGER PRIMARY KEY, "
        "$columnKey description TEXT, "
        "$columnUsername is_done INTEGER "
        ")");
  }
}
