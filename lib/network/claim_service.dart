import 'package:dio/dio.dart';
import 'package:flutter_insurance_claim/model/claim.dart';

class ClaimService {
  final Dio _client;
  static const String _baseUrl = 'https://jsonplaceholder.typicode.com';

  // Default constructor (uses real Dio)
  ClaimService() : _client = Dio();

  // Extra constructor for testing (uses mock Dio)
  ClaimService.withClient(this._client);

  Future<List<Claim>> getClaims() async {
    try {
      final response = await _client.get('$_baseUrl/posts');

      if (response.statusCode == 200) {
        final List claim = response.data;
        return claim.map((e) => Claim.fromJson(e)).toList();
      } else {
        throw Exception('API returned an error: ${response.data}');
      }
    } on DioException catch (e) {
      throw Exception('Failed to fetch claims: ${e.message}');
    }
  }
}
