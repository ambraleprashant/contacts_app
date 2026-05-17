import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../providers/contact_provider.dart';
import '../widgets/contact_tile.dart';
import '../widgets/empty_widget.dart';

class FavoritesScreen extends StatelessWidget {
  const FavoritesScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Consumer<ContactProvider>(
      builder: (context, provider, child) {
        if (provider.isLoading) {
          return const Center(child: CircularProgressIndicator());
        }

        final favorites = provider.favoriteContacts;

        if (favorites.isEmpty) {
          return const EmptyWidget(
            message: 'No favorite contacts yet.',
            icon: Icons.star_border,
          );
        }

        return ListView.builder(
          itemCount: favorites.length,
          itemBuilder: (context, index) {
            final contact = favorites[index];
            return ContactTile(contact: contact);
          },
        );
      },
    );
  }
}
