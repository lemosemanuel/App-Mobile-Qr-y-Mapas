import 'package:flutter/material.dart';
import 'package:qr_mapa_sql/pages/home_page.dart';
import 'package:qr_mapa_sql/pages/mapa_page.dart';
import 'package:provider/provider.dart';
import 'package:qr_mapa_sql/providers/scan_list_provider.dart';
import 'package:qr_mapa_sql/providers/ui_provider.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (_) => UiProvider()),
        ChangeNotifierProvider(create: (_) => ScanListProvider()),
      ],
      child: MaterialApp(
          debugShowCheckedModeBanner: false,
          title: 'QR Mapa Y SQL',
          initialRoute: 'home',
          routes: {
            'home': (BuildContext context) => HomePage(),
            'mapa': (BuildContext context) => Mapa_page(),
          },
          theme: ThemeData.dark()),
    );
  }
}
