import 'package:flutter/material.dart';
import 'package:flutter_barcode_scanner/flutter_barcode_scanner.dart';
import 'package:provider/provider.dart';
import 'package:qr_mapa_sql/providers/scan_list_provider.dart';
import 'package:qr_mapa_sql/utils/utils.dart';

class FloatingABPersdonalizado extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return FloatingActionButton(
        child: Icon(Icons.filter_center_focus),
        onPressed: () async {
          String qrScanRes = await FlutterBarcodeScanner.scanBarcode(
              '#3D8BEF', 'Cancelar', false, ScanMode.QR);

          // final qrScanRes = 'https://www.gmail.com.ar';
          // busco la instancia de scanlistprovider
          final scanlistprovider =
              Provider.of<ScanListProvider>(context, listen: false);

          // agrego un registro
          final nuevoscan = await scanlistprovider.nuevoScan(qrScanRes);
          // final nuevoscan =
          //     await scanlistprovider.nuevoScan('geo:-35.6318271,-52.4055628');

          if (qrScanRes == '-1') {
            return;
          }

          launchUrl(context, nuevoscan);
        });
  }
}
