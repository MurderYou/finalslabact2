import 'package:flutter/material.dart';

import '../routes/app_routes.dart';
import '../widgets/app_drawer.dart';

class ContactScreen extends StatefulWidget {
  const ContactScreen({super.key});

  @override
  State<ContactScreen> createState() => _ContactScreenState();
}

class _ContactScreenState extends State<ContactScreen> {
  final _formKey = GlobalKey<FormState>();
  final _nameCtrl = TextEditingController();
  final _emailCtrl = TextEditingController();
  final _confirmCtrl = TextEditingController();
  final _messageCtrl = TextEditingController();

  static final _emailRegex = RegExp(r'^[\w.+-]+@[\w-]+\.[\w.-]+$');
  static final _nameRegex = RegExp(r"^[A-Za-z .'-]+$");

  @override
  void dispose() {
    _nameCtrl.dispose();
    _emailCtrl.dispose();
    _confirmCtrl.dispose();
    _messageCtrl.dispose();
    super.dispose();
  }

  // ---------- Validators ----------
  String? _validateName(String? v) {
    final value = v?.trim() ?? '';
    if (value.isEmpty) return 'Please enter your name.';
    if (value.length < 2) return 'Name must be at least 2 characters.';
    if (!_nameRegex.hasMatch(value)) return 'Name may contain letters only.';
    return null;
  }

  String? _validateEmail(String? v) {
    final value = v?.trim() ?? '';
    if (value.isEmpty) return 'Please enter your email.';
    if (!_emailRegex.hasMatch(value)) {
      return 'Enter a valid email (e.g. name@example.com).';
    }
    return null;
  }

  String? _validateConfirm(String? v) {
    final value = v?.trim() ?? '';
    if (value.isEmpty) return 'Please confirm your email.';
    if (value != _emailCtrl.text.trim()) return 'Emails do not match.';
    return null;
  }

  String? _validateMessage(String? v) {
    final value = v?.trim() ?? '';
    if (value.isEmpty) return 'Please write a message.';
    if (value.length < 10) return 'Message must be at least 10 characters.';
    return null;
  }

  Future<void> _submit() async {
    if (!_formKey.currentState!.validate()) return;

    await showDialog<void>(
      context: context,
      barrierDismissible: false,
      builder: (ctx) => AlertDialog(
        title: const Text('Message sent'),
        content: Text('Thank you, ${_nameCtrl.text.trim()}! We will reply soon.'),
        actions: [
          TextButton(
            onPressed: () => Navigator.pop(ctx),
            child: const Text('Back to Home'),
          ),
        ],
      ),
    );

    if (!mounted) return;
    // Clears the navigation stack and returns to Home.
    Navigator.pushNamedAndRemoveUntil(context, AppRoutes.home, (route) => false);
  }

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);

    return Scaffold(
      appBar: AppBar(title: const Text('Contact Us')),
      drawer: const AppDrawer(currentRoute: AppRoutes.contact),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text('Get in Touch', style: theme.textTheme.headlineMedium),
            const SizedBox(height: 12),
            const Card(
              child: Column(
                children: [
                  ListTile(
                    leading: Icon(Icons.location_on),
                    title: Text('Katapatan Mutual Homes, Brgy. Banay-banay, '
                        'City of Cabuyao, Laguna 4025'),
                  ),
                  ListTile(
                    leading: Icon(Icons.email),
                    title: Text('meettheteam@example.com'),
                  ),
                  ListTile(
                    leading: Icon(Icons.phone),
                    title: Text('+63 900 000 0000'),
                  ),
                ],
              ),
            ),
            const SizedBox(height: 20),
            Text('Send a Message', style: theme.textTheme.titleLarge),
            const SizedBox(height: 12),
            Form(
              key: _formKey,
              child: Column(
                children: [
                  TextFormField(
                    controller: _nameCtrl,
                    decoration: const InputDecoration(
                        labelText: 'Name', prefixIcon: Icon(Icons.person)),
                    textInputAction: TextInputAction.next,
                    validator: _validateName,
                  ),
                  const SizedBox(height: 12),
                  TextFormField(
                    controller: _emailCtrl,
                    decoration: const InputDecoration(
                        labelText: 'Email', prefixIcon: Icon(Icons.email)),
                    keyboardType: TextInputType.emailAddress,
                    textInputAction: TextInputAction.next,
                    validator: _validateEmail,
                  ),
                  const SizedBox(height: 12),
                  TextFormField(
                    controller: _confirmCtrl,
                    decoration: const InputDecoration(
                        labelText: 'Confirm Email',
                        prefixIcon: Icon(Icons.mark_email_read)),
                    keyboardType: TextInputType.emailAddress,
                    textInputAction: TextInputAction.next,
                    validator: _validateConfirm,
                  ),
                  const SizedBox(height: 12),
                  TextFormField(
                    controller: _messageCtrl,
                    decoration: const InputDecoration(
                        labelText: 'Message', alignLabelWithHint: true),
                    maxLines: 5,
                    maxLength: 300,
                    validator: _validateMessage,
                  ),
                  const SizedBox(height: 12),
                  SizedBox(
                    width: double.infinity,
                    child: ElevatedButton.icon(
                      onPressed: _submit,
                      icon: const Icon(Icons.send),
                      label: const Text('Send Message'),
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
