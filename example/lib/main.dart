import 'package:flutter/material.dart';
import 'package:tdtx_nf_icons/tdtx_nf_icons.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Pruebas de Icons TDTxLE',
      home: Scaffold(
        appBar: AppBar(
          title: const Text("Pruebas de Icons TDTxLE"),
        ),
        body: Center(
          child: Icon(
            TDTxNFIcons.nf_fa_ambulance,
            // TDTxNeFIcons.nf_cod_account,
            size: 34,
          ),
        ),
      ),
    );
  }
}
