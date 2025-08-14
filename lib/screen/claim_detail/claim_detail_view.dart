import 'package:flutter/material.dart';
import 'package:flutter_insurance_claim/model/claim.dart';

class ClaimDetailView extends StatelessWidget {
  final Claim claim;

  const ClaimDetailView({super.key, required this.claim});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text(claim.title)),
      body: Padding(
        padding: const EdgeInsets.all(8),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Text(
              claim.title,
              textAlign: TextAlign.center,
              style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
            ),
            SizedBox(height: 16),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text("Claim ID: ${claim.id.toString()}"),
                SizedBox(width: 16),
                Text("Claimant ID: ${claim.userId.toString()}"),
              ],
            ),
            SizedBox(height: 16),
            Text(
              claim.body,
              style: TextStyle(fontSize: 16),
            ),
          ],
        ),
      ),
    );
  }
}
