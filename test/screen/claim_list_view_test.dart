import 'package:flutter/material.dart';
import 'package:flutter_insurance_claim/model/claim.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:provider/provider.dart';
import 'package:flutter_insurance_claim/screen/claim_list/claim_list_view.dart';
import 'package:flutter_insurance_claim/screen/claim_list/claim_list_view_model.dart';

void main() {
  testWidgets('displays claim list items', (WidgetTester tester) async {
    // Create a fake ViewModel with sample data
    final viewModel = ClaimListViewModel();
    viewModel.displayedClaims = [
      Claim(userId: 1, id: 101, title: 'Test Claim', body: 'Description here'),
    ];

    await tester.pumpWidget(
      MaterialApp(
        home: ChangeNotifierProvider<ClaimListViewModel>.value(
          value: viewModel,
          child: const ClaimListView(autoFetch: false),
        ),
      ),
    );

    // Wait for widget build
    await tester.pump();

    // Verify the claim title is shown
    expect(find.text('Test Claim'), findsOneWidget);
  });
}
