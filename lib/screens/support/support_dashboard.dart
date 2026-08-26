import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

class SupportDashboard extends StatelessWidget {
  const SupportDashboard({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Support Dashboard'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Text('Support Dashboard', style: TextStyle(fontSize: 24)),
            const SizedBox(height: 16),
            ElevatedButton(
              onPressed: () {
                context.go('/support/tickets');
              },
              child: const Text('Manage Tickets'),
            ),
            const SizedBox(height: 8),
            ElevatedButton(
              onPressed: () {
                // Placeholder for other support pages
                ScaffoldMessenger.of(context).showSnackBar(const SnackBar(
                  content: Text('Other support pages not implemented yet'),
                ));
              },
              child: const Text('Other Support Actions'),
            ),
          ],
        ),
      ),
    );
  }
}
