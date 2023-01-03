import 'package:flutter/cupertino.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

final counterProvider = ChangeNotifierProvider((ref)=>CounterProvider());

final countStateProvider = StateProvider((ref) => 0);

class CounterProvider extends ChangeNotifier{

  int number=0;
  void addNumber(){

      number++;
      notifyListeners();

  }
  void minusNumber(){

      number--;
    notifyListeners();
  }

}