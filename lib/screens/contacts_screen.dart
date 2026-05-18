import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../providers/contact_provider.dart';
import '../widgets/contact_tile.dart';
import '../widgets/empty_widget.dart';

class ContactsScreen extends StatelessWidget {
  const ContactsScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Consumer<ContactProvider>(
      builder: (context, provider, child) {
        if (provider.isLoading) {
          return const Center(child: CircularProgressIndicator());
        }

        if (provider.contacts.isEmpty) {
          return const EmptyWidget(message: 'No contacts yet.\nTap + to add one.');
        }

        final contacts = provider.searchedContacts;

        if (contacts.isEmpty) {
          return const EmptyWidget(
            message: 'No matching contacts found.',
            icon: Icons.search_off,
          );
        }

        return ListView.builder(
          itemCount: contacts.length,
          itemBuilder: (context, index) {
            final contact = contacts[index];
            return ContactTile(contact: contact);
          },
        );
      },
    );
  }
}
