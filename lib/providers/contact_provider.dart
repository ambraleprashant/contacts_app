import 'package:flutter/material.dart';
import '../models/contact_model.dart';
import '../services/database_service.dart';

class ContactProvider extends ChangeNotifier {
  List<Contact> _contacts = [];
  bool _isLoading = false;

  List<Contact> get contacts => _contacts;
  List<Contact> get favoriteContacts => _contacts.where((c) => c.isFavorite).toList();
  bool get isLoading => _isLoading;

  Future<void> fetchContacts() async {
    _isLoading = true;
    notifyListeners();

    _contacts = await DatabaseService.instance.getContacts();

    _isLoading = false;
    notifyListeners();
  }

  Future<void> addContact(Contact contact) async {
    final newContact = await DatabaseService.instance.insertContact(contact);
    _contacts.add(newContact);
    _sortContacts();
    notifyListeners();
  }

  Future<void> updateContact(Contact contact) async {
    await DatabaseService.instance.updateContact(contact);
    final index = _contacts.indexWhere((c) => c.id == contact.id);
    if (index != -1) {
      _contacts[index] = contact;
      _sortContacts();
      notifyListeners();
    }
  }

  Future<void> deleteContact(int id) async {
    await DatabaseService.instance.deleteContact(id);
    _contacts.removeWhere((c) => c.id == id);
    notifyListeners();
  }

  Future<void> toggleFavorite(Contact contact) async {
    final updatedContact = contact.copyWith(isFavorite: !contact.isFavorite);
    await updateContact(updatedContact);
  }
  
  void _sortContacts() {
    _contacts.sort((a, b) => a.name.toLowerCase().compareTo(b.name.toLowerCase()));
  }
}
