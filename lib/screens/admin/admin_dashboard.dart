import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

class AdminDashboard extends StatelessWidget {
  const AdminDashboard({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Admin Dashboard'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Text('Admin Dashboard', style: TextStyle(fontSize: 24)),
            const SizedBox(height: 16),
            ElevatedButton(
              onPressed: () {
                context.go('/admin/users');
              },
              child: const Text('Manage Users'),
            ),
            const SizedBox(height: 8),
            ElevatedButton(
              onPressed: () {
                // Placeholder for other admin pages
                ScaffoldMessenger.of(context).showSnackBar(const SnackBar(
                  content: Text('Other admin pages not implemented yet'),
                ));
              },
              child: const Text('Other Admin Actions'),
            ),
          ],
        ),
      ),
    );
  }
}
