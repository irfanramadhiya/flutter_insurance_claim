import 'package:flutter_test/flutter_test.dart';
import 'package:mocktail/mocktail.dart';
import 'package:dio/dio.dart';
import 'package:flutter_insurance_claim/model/claim.dart';
import 'package:flutter_insurance_claim/network/claim_service.dart';

class MockDio extends Mock implements Dio {}

void main() {
  late MockDio mockDio;
  late ClaimService service;

  setUp(() {
    mockDio = MockDio();
    service = ClaimService.withClient(
      mockDio,
    ); // Create an alt constructor for injection
  });

  test('fetches and parses claims successfully', () async {
    final mockResponse = Response(
      requestOptions: RequestOptions(path: ''),
      statusCode: 200,
      data: [
        {
          "userId": 101,
          "id": 2001,
          "title": "Vehicle damage",
          "body": "Hit from behind at a traffic light...",
        },
      ],
    );

    when(() => mockDio.get(any())).thenAnswer((_) async => mockResponse);

    final claims = await service.getClaims();

    expect(claims, isA<List<Claim>>());
    expect(claims.length, 1);
    expect(claims.first.title, "Vehicle damage");
  });
}
