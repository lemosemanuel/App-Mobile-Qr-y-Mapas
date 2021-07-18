import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:qr_mapa_sql/providers/scan_list_provider.dart';
import 'package:qr_mapa_sql/utils/utils.dart';

class scanTiles extends StatelessWidget {
  final String tipo;

  const scanTiles({required this.tipo});

  @override
  Widget build(BuildContext context) {
    final scanlistprovider = Provider.of<ScanListProvider>(context);
    final scans = scanlistprovider.scans;
    return ListView.builder(
      itemBuilder: (_, i) => Dismissible(
        key: UniqueKey(),
        background: Container(color: Colors.redAccent),
        onDismissed: (DismissDirection direction) {
          Provider.of<ScanListProvider>(context, listen: false)
              .borrarScanPorId(scans[i].id!.toInt());
        },
        child: ListTile(
          leading: Icon(
              this.tipo == 'http' ? Icons.home_outlined : Icons.map_outlined,
              color: Theme.of(context).primaryColorLight),
          title: Text('${scanlistprovider.scans[i].valor}'),
          subtitle: Text('${scanlistprovider.scans[i].id.toString()}'),
          trailing: Icon(Icons.keyboard_arrow_right, color: Colors.green),
          onTap: () => launchUrl(context, scans[i]),
        ),
      ),
      itemCount: scanlistprovider.scans.length,
    );
  }
}
