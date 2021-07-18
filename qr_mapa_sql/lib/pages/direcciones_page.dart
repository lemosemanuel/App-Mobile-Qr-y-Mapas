import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:qr_mapa_sql/providers/scan_list_provider.dart';
import 'package:qr_mapa_sql/widgets/scan_tiles.dart';

class DireccionesPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return scanTiles(tipo: 'http');
  }
}
