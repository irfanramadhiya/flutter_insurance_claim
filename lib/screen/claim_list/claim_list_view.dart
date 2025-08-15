import 'package:flutter/material.dart';
import 'package:flutter_insurance_claim/screen/claim_detail/claim_detail_view.dart';
import 'package:flutter_insurance_claim/screen/claim_list/claim_list_view_model.dart';
import 'package:provider/provider.dart';

class ClaimListView extends StatelessWidget {
  final bool autoFetch;
  const ClaimListView({super.key, this.autoFetch = true});

  @override
  Widget build(BuildContext context) {
    final vm = context.watch<ClaimListViewModel>();

    if (autoFetch) {
      Future.microtask(() {
        vm.fetchClaims(context);
      });
    }

    return Scaffold(
      appBar: AppBar(
        title: Text("Claims List"),
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
          : vm.displayedClaims.isEmpty
          ? Center(child: Text('No claims yet!'))
          : Container(
              margin: EdgeInsets.only(top: 8),
              child: ListView.builder(
                padding: const EdgeInsets.all(8),
                itemCount: vm.displayedClaims.length,
                itemBuilder: (context, index) {
                  final claim = vm.displayedClaims[index];
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
                        Navigator.of(context).push(
                          MaterialPageRoute(
                            builder: (_) => ClaimDetailView(claim: claim),
                          ),
                        );
                      },
                    ),
                  );
                },
              ),
            ),
    );
  }
}
