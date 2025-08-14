import 'package:dio/dio.dart';
import 'package:flutter_insurance_claim/model/claim.dart';

class ClaimService {
  static const String _baseUrl = 'https://jsonplaceholder.typicode.com';

  Future<List<Claim>> getClaims() async {
    try {
      print("called");
      final response = await Dio().get('$_baseUrl/posts');

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
