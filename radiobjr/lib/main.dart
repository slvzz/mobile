import 'package:flutter/material.dart';
import 'package:radiobjr/modules/home/home_page.dart';
import 'package:radiobjr/shared/widgets/Header.dart';
import 'package:radiobjr/shared/widgets/footer.dart';

void main() {
  runApp(MeuApp());
}

class MeuApp extends StatelessWidget {
  const MeuApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        body: Column(
          children: const[
            Header(),
            HomePage(),
            Spacer(),
            Footer(),
          ],
        ),
      ),
    );
  }
}
