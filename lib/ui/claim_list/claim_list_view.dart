import 'package:flutter/material.dart';
import 'package:flutter_insurance_claim/ui/claim_list/claim_list_view_model.dart';
import 'package:provider/provider.dart';

class ClaimListView extends StatelessWidget {
  const ClaimListView({super.key});

  @override
  Widget build(BuildContext context) {
    final vm = context.watch<ClaimListViewModel>();

    Future.microtask(() {
      vm.fetchClaims(context);
    });

    return Scaffold(
      appBar: AppBar(
        bottom: PreferredSize(
          preferredSize: const Size.fromHeight(48),
          child: Padding(
            padding: const EdgeInsets.all(8),
            child: TextField(
              onChanged: vm.updateSearch,
              decoration: InputDecoration(
                hintText: 'Search claims...',
                prefixIcon: const Icon(Icons.search),
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(10),
                ),
                contentPadding: const EdgeInsets.symmetric(vertical: 0),
              ),
            ),
          ),
        ),
      ),
      body: vm.isLoading
          ? const Center(child: CircularProgressIndicator())
          : vm.claims.isEmpty
          ? Center(child: Text('No claims yet!'))
          : Container(
              margin: EdgeInsets.only(top: 8),
              child: ListView.builder(
                padding: const EdgeInsets.all(8),
                itemCount: vm.claims.length,
                itemBuilder: (context, index) {
                  final claim = vm.claims[index];
                  return Card(
                    elevation: 4,
                    margin: const EdgeInsets.symmetric(vertical: 8),
                    child: ListTile(
                      title: Text(
                        claim.title,
                        style: const TextStyle(fontWeight: FontWeight.bold),
                      ),
                      subtitle: Text(
                        claim.body,
                        maxLines: 2,
                        overflow: TextOverflow.ellipsis,
                      ),
                      onTap: () {
                        // Navigate to detail page
                      },
                    ),
                  );
                },
              ),
            ),
    );
  }
}
