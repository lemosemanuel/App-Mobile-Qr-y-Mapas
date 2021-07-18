import 'package:flutter/material.dart';
import 'package:flutter_barcode_scanner/flutter_barcode_scanner.dart';
import 'package:provider/provider.dart';
import 'package:qr_mapa_sql/models/scan_model.dart';
import 'package:qr_mapa_sql/pages/direcciones_page.dart';
import 'package:qr_mapa_sql/pages/mapas_page.dart';
import 'package:qr_mapa_sql/providers/scan_list_provider.dart';
import 'package:qr_mapa_sql/providers/ui_provider.dart';
import 'package:qr_mapa_sql/widgets/curstom_navigatorbar.dart';
import 'package:qr_mapa_sql/widgets/db_provider.dart';
import 'package:qr_mapa_sql/widgets/flatingAB_personalizado.dart';

class HomePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        elevation: 0,
        title: Text('Historial'),
        actions: [
          IconButton(
              icon: Icon(Icons.delete_forever),
              onPressed: () {
                Provider.of<ScanListProvider>(context, listen: false)
                    .borrarTodos();
              })
        ],
      ),
      body: _HomePageBody(),
      bottomNavigationBar: BarraDelBottom(),
      floatingActionButton: FloatingABPersdonalizado(),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
    );
  }
}

// class _HomePageBody extends StatelessWidget {
//   const _HomePageBody({Key? key}) : super(key: key);

//   @override
//   Widget build(BuildContext context) {
//     // voy a hacer un condicional de opciones para el body , entre el mapa y las direcciones
//     // es importante decir de donde lo vamos a importar con <UiProvider>
//     final uiProvider = Provider.of<UiProvider>(context);
//     final currentIndex = uiProvider.seleccionarMenu;
//     // leer la base de datos
//     // final tempScan = ScanModel(valor: 'http://google.com');
//     // DBProvider.db.nuevoScan(tempScan);
//     // print("${tempScan}");
//     // ya puedo obtener aca lo que quiero con el id
//     // DBProvider.db
//     //     .getScanById(7)
//     //     .then((value) => print(value!.valor.toString()));

//     // DBProvider.db.getScanPorTipo('id').then((value) => print(value));
//     // DBProvider.db.deleteAllScan().then((value) => print(value));

//     // voy a usar el ScanListProvider
//     final scanlistprovider =
//         Provider.of<ScanListProvider>(context, listen: false);
//     switch (currentIndex) {
//       case 0:
//         scanlistprovider.cargarScansPorTipo('geo');
//         return MapasPage();

//       case 1:
//         scanlistprovider.cargarScansPorTipo('https');
//         return DireccionesPage();

//       default:
//         return MapasPage();
//     }
//   }
// }

class _HomePageBody extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    // Obtener el selected menu opt
    final uiProvider = Provider.of<UiProvider>(context);

    // Cambiar para mostrar la pagina respectiva
    final currentIndex = uiProvider.selectedMenuOpt;

    // Usar el ScanListProvider
    final scanListProvider =
        Provider.of<ScanListProvider>(context, listen: false);

    switch (currentIndex) {
      case 0:
        scanListProvider.cargarScanPorTipo('geo');
        return MapasPage();

      case 1:
        scanListProvider.cargarScanPorTipo('http');
        return DireccionesPage();

      default:
        return MapasPage();
    }
  }
}
