import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';
import 'package:flutter_phone_direct_caller/flutter_phone_direct_caller.dart';
import '../models/contact_model.dart';
import '../utils/constants.dart';
import '../screens/contact_detail_screen.dart';

class ContactTile extends StatelessWidget {
  final Contact contact;

  const ContactTile({Key? key, required this.contact}) : super(key: key);

  Future<void> _makeDirectCall(String phoneNumber) async {
    final bool? res = await FlutterPhoneDirectCaller.callNumber(phoneNumber);
    if (res == null || !res) {
      final Uri launchUri = Uri(
        scheme: 'tel',
        path: phoneNumber,
      );
      if (await canLaunchUrl(launchUri)) {
        await launchUrl(launchUri);
      }
    }
  }

  @override
  Widget build(BuildContext context) {
    return ListTile(
      leading: CircleAvatar(
        backgroundColor: _getAvatarColor(contact.name),
        child: Text(
          contact.name.isNotEmpty ? contact.name[0].toUpperCase() : '?',
          style: const TextStyle(color: Colors.white, fontWeight: FontWeight.bold),
        ),
      ),
      title: Text(contact.name, style: AppTextStyles.title),
      subtitle: Text(contact.phone, style: AppTextStyles.subtitle),
      trailing: Row(
        mainAxisSize: MainAxisSize.min,
        children: [
          if (contact.isFavorite)
            const Icon(Icons.star, color: Colors.amber),
          const SizedBox(width: 8),
          IconButton(
            icon: const Icon(Icons.call, color: Colors.green),
            onPressed: () => _makeDirectCall(contact.phone),
          ),
        ],
      ),
      onTap: () {
        Navigator.push(
          context,
          MaterialPageRoute(
            builder: (context) => ContactDetailScreen(contact: contact),
          ),
        );
      },
    );
  }

  Color _getAvatarColor(String name) {
    final colors = [
      Colors.red, Colors.green, Colors.blue, Colors.orange, 
      Colors.purple, Colors.teal, Colors.pink
    ];
    int hash = 0;
    for (var i = 0; i < name.length; i++) {
      hash = name.codeUnitAt(i) + ((hash << 5) - hash);
    }
    return colors[hash.abs() % colors.length];
  }
}
