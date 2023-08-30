import 'package:flutter/material.dart';
import 'package:tdtx_nf_icons/tdtx_nf_icons.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Material App',
      home: Scaffold(
        appBar: AppBar(
          title: const Text('Material App Bar'),
        ),
        body: const Center(
          child: Icon(
            TdtxNfIcons.nf_cod_account,
            size: 34,
          ),
        ),
      ),
    );
  }
}
