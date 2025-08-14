import 'package:flutter/material.dart';
import 'package:flutter_insurance_claim/model/claim.dart';
import 'package:flutter_insurance_claim/network/claim_service.dart';

class ClaimListViewModel extends ChangeNotifier {
  bool isLoading = false;
  List<Claim> claims = [];
  List<Claim> allClaims = [];
  final ClaimService _claimService = ClaimService();
  bool isFirstTime = true;
  String _searchQuery = '';

  Future<void> fetchClaims(BuildContext context) async {
    if(!isFirstTime){
      return;
    }
    
    isLoading = true;
    isFirstTime = false;
    notifyListeners();

    try {
      allClaims = await _claimService.getClaims();
      claims = allClaims;
      print(claims.length);
    } catch (e) {
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(
          content: Text('Something went wrong please try again later'),
        ),
      );
    }

    isLoading = false;
    notifyListeners();
  }

  void updateSearch(String query) {
    _searchQuery = query;
    _applySearch();
  }

  void _applySearch() {
    if (_searchQuery.isEmpty) {
      claims = allClaims;
    } else {
      claims = allClaims
          .where(
            (claim) =>
                claim.title.toLowerCase().contains(_searchQuery.toLowerCase()),
          )
          .toList();
    }
    notifyListeners();
  }
}
