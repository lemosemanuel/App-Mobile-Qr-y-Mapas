import 'package:flutter/material.dart';
import 'package:qr_mapa_sql/models/scan_model.dart';
import 'package:url_launcher/url_launcher.dart';

launchUrl(BuildContext context, ScanModel scan) async {
  final url = scan.valor;
  if (scan.tipo == 'http') {
    //aca abro el sitio web
    await canLaunch(url!) ? await launch(url) : throw 'Could not launch $url';
  } else {
    Navigator.pushNamed(context, 'mapa', arguments: scan);
  }
}
