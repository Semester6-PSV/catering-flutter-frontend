import 'package:flutter/material.dart';
import 'package:catering_flutter_frontend/config/index.dart';
import 'package:catering_flutter_frontend/pages/index.dart';
import 'package:socket_io_client/socket_io_client.dart' as IO;

void main() {
  IO.Socket socket = IO.io('http://192.168.178.64:1080', <String, dynamic>{
    'transports': ['websocket'],
    'autoConnect': true
  });

  socket.on('sample-event', (data) => print(data));
  socket.onDisconnect((_) => print('disconnect'));
  socket.onConnectError((error) => print(error));

  runApp(CateringApp(socket: socket,));
}

class CateringApp extends StatelessWidget {
  final  IO.Socket socket;
  
  const CateringApp({Key? key, required this.socket}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Catering App',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
          primaryColor: COLOR_RED,
          splashColor: COLOR_GREY_LIGHT,
          colorScheme:
              ColorScheme.fromSwatch().copyWith(secondary: COLOR_GREY)),
          initialRoute: '/orderPage',
          routes: <String, WidgetBuilder>{
            '/orderPage': (BuildContext context) => OrderPage(socket: socket),
            '/orderOverviewPage': (BuildContext context) => OrderOverviewPage(socket: socket)
          },
    );
  }
}