import 'package:flutter/material.dart';
import 'package:qr_mapa_sql/models/scan_model.dart';
import 'package:qr_mapa_sql/widgets/db_provider.dart';

class ScanListProvider extends ChangeNotifier {
  List<ScanModel> scans = [];
  String tipoSeleccionado = 'http';

  Future<ScanModel> nuevoScan(String valor) async {
    // este es el valor que toma el escaneo
    final nuevoScan = new ScanModel(valor: valor);

    // ahora lo vamos a guardar en la base de datos
    final id = await DBProvider.db.nuevoScan(nuevoScan);

    nuevoScan.id = id;

    // lo agrego a la lista que cree arriba pero con una condicion (porque van a haber latitudes y long tambien)
    if (this.tipoSeleccionado == nuevoScan.tipo) {
      this.scans.add(nuevoScan);
      // uso el notify para que se redibuje
      notifyListeners();
    }

    return nuevoScan;
  }

  cargarScans() async {
    final scans = await DBProvider.db.getTodosLosScans();
    this.scans = [...scans];
    notifyListeners();
  }

  cargarScanPorTipo(String tipo) async {
    final scans = await DBProvider.db.getScansPorTipo(tipo);
    this.scans = [...scans];
    this.tipoSeleccionado = tipo;
    notifyListeners();
  }

  borrarTodos() async {
    await DBProvider.db.deleteAllScans();
    this.scans = [];
    notifyListeners();
  }

  borrarScanPorId(int id) async {
    await DBProvider.db.deleteScan(id);
  }
  // no pongo el notify porque en la funcion de arriba ya lo carga
  // notifyListeners();

}
