import 'dart:convert';

import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:mysql1/mysql1.dart';
import 'package:shelf/shelf.dart';
import 'package:shelf/shelf_io.dart' as shelf_io;
import 'package:shelf_router/shelf_router.dart';

final dbSettings = ConnectionSettings(
  host: dotenv.get('DATABASE_HOST'),
  port: int.parse(dotenv.get('DATABASE_PORT')),
  user: dotenv.get('DATABASE_USER'),
  password: dotenv.get('DATABASE_PASSWORD'),
  db: dotenv.get('DATABASE_NAME'),
);

Future<MySqlConnection> openDbConnection() async {
  return await MySqlConnection.connect(dbSettings);
}

Future<Response> _getRooms(Request request) async {
  final conn = await openDbConnection();
  var results = await conn.query('SELECT * FROM rooms');
  var rooms =
      results.map((row) {
        return {
          'id': row[0],
          'name': row[1],
          'description': row[2],
          'creator_id': row[3],
        };
      }).toList();
  await conn.close();
  return Response.ok(
    jsonEncode(rooms),
    headers: {'Content-Type': 'application/json'},
  );
}

Future<Response> _createRoom(Request request) async {
  final conn = await openDbConnection();
  var payload = jsonDecode(await request.readAsString());
  var name = payload['name'];
  var description = payload['description'];
  var creatorId = payload['creator_id'];

  var result = await conn.query(
    'INSERT INTO rooms (name, description, creator_id) VALUES (?, ?, ?)',
    [name, description, creatorId],
  );
  await conn.close();
  return Response.ok('Room created successfully!');
}

void main() async {
  final router =
      Router()
        ..get('/rooms', _getRooms)
        ..post('/rooms', _createRoom);

  final handler = Pipeline().addMiddleware(logRequests()).addHandler(router);

  var server = await shelf_io.serve(handler, 'localhost', 8080);
  print('Serving at http://${server.address.host}:${server.port}');
}
