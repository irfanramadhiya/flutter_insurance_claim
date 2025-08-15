// This is a basic Flutter widget test.
//
// To perform an interaction with a widget in your test, use the WidgetTester
// utility in the flutter_test package. For example, you can send tap and scroll
// gestures. You can also use WidgetTester to find child widgets in the widget
// tree, read text, and verify that the values of widget properties are correct.

import 'package:flutter_insurance_claim/model/claim.dart';
import 'package:flutter_test/flutter_test.dart';


void main() {
  group('Claim model', () {
    test('fromJson should parse correctly', () {
      final json = {
        "userId": 101,
        "id": 2001,
        "title": "Vehicle damage",
        "body": "Hit from behind at a traffic light...",
      };

      final claim = Claim.fromJson(json);

      expect(claim.userId, 101);
      expect(claim.id, 2001);
      expect(claim.title, "Vehicle damage");
      expect(claim.body, "Hit from behind at a traffic light...");
    });
  });
}
