import 'package:flutter/material.dart';

// el change notifier lo que hace es notifica a las otras ramas los cambios
class UiProvider extends ChangeNotifier {
  int _selectedMenuOpt = 0;
  // para cambiar esto necesito un geter y un seter

  int get selectedMenuOpt {
    return this._selectedMenuOpt;
  }

  // recibe un i y lo coloca en seleccionar menu
  set selectedMenuOpt(int i) {
    this._selectedMenuOpt = i;
    // notificamos a todas las partes cuando cambia el valor
    notifyListeners();
  }
}
