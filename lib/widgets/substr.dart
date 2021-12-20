import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

final oCcy = NumberFormat("#,##0.00", "id_INA");
Widget substrText(data1, double data2, data3) => Text(
      '$data1 : ' + data2.toStringAsFixed(2) + ' $data3',
      style: const TextStyle(fontWeight: FontWeight.bold, fontSize: 16),
    );
