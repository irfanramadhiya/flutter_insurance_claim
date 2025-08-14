import 'package:flutter/material.dart';
import 'package:flutter_insurance_claim/ui/claim_list/claim_list_view.dart';
import 'package:flutter_insurance_claim/ui/claim_list/claim_list_view_model.dart';
import 'package:provider/provider.dart';

void main() {
  runApp(
    MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (_) => ClaimListViewModel()),
      ],
      child: const MyApp(),
    ),
  );
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Insurance Claim',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.lightBlue),
      ),
      home: const ClaimListView(),
    );
  }
}
