import 'package:flutter/material.dart';
import 'data/repository.dart';
import 'root_nav.dart';
import 'theme.dart';

class AmaraverseApp extends StatelessWidget {
  const AmaraverseApp({super.key});

  @override
  Widget build(BuildContext context) {
    // Single composition root: swap MockRepository for an ApiRepository here
    // to go live — no screen changes required.
    const AmaraverseRepository repo = MockRepository();
    return MaterialApp(
      title: 'AMARATWIN',
      debugShowCheckedModeBanner: false,
      theme: AppTheme.dark,
      home: const RootNav(repo: repo),
    );
  }
}
