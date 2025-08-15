import 'package:flutter/material.dart';
import 'package:flutter_insurance_claim/model/claim.dart';
import 'package:flutter_insurance_claim/network/claim_service.dart';

class ClaimListViewModel extends ChangeNotifier {
  bool isLoading = false;
  bool hasFetchedOnce = true;

  List<Claim> displayedClaims = [];
  List<Claim> allClaims = [];

  final ClaimService _claimService = ClaimService();
  
  String _searchQuery = '';

  Future<void> fetchClaims(BuildContext context) async {
    if(!hasFetchedOnce){
      return;
    }
    
    isLoading = true;
    hasFetchedOnce = false;
    notifyListeners();

    try {
      allClaims = await _claimService.getClaims();
      displayedClaims = allClaims;
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
      displayedClaims = allClaims;
    } else {
      displayedClaims = allClaims
          .where(
            (claim) =>
                claim.title.toLowerCase().contains(_searchQuery.toLowerCase()),
          )
          .toList();
    }
    notifyListeners();
  }
}
