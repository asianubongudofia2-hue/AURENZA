import 'package:flutter/material.dart';
import '../models/user.dart';
import '../services/api_service.dart';
import 'package:go_router/go_router.dart';

class AdminUserDetail extends StatefulWidget {
  final int userId;
  const AdminUserDetail({super.key, required this.userId});

  @override
  State<AdminUserDetail> createState() => _AdminUserDetailState();
}

class _AdminUserDetailState extends State<AdminUserDetail> {
  late Future<User> _futureUser;

  @override
  void initState() {
    super.initState();
    _futureUser = ApiService.fetchUserById(widget.userId);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Admin — User Detail'),
      ),
      body: FutureBuilder<User>(
        future: _futureUser,
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            return const Center(child: CircularProgressIndicator());
          } else if (snapshot.hasError) {
            return Center(child: Text('Error: ${snapshot.error}'));
          } else if (!snapshot.hasData) {
            return const Center(child: Text('User not found'));
          }

          final u = snapshot.data!;
          return Padding(
            padding: const EdgeInsets.all(16.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(u.name, style: Theme.of(context).textTheme.headlineSmall),
                const SizedBox(height: 8),
                Text('@${u.username}'),
                const SizedBox(height: 8),
                Text('Email: ${u.email}'),
                const SizedBox(height: 8),
                Text('Phone: ${u.phone}'),
                const SizedBox(height: 8),
                Text('Website: ${u.website}'),
                const SizedBox(height: 8),
                Text('Company: ${u.company}'),
                const SizedBox(height: 8),
                Text('Address: ${u.address}'),
                const SizedBox(height: 16),
                ElevatedButton(
                  onPressed: () {
                    context.pop();
                  },
                  child: const Text('Back'),
                )
              ],
            ),
          );
        },
      ),
    );
  }
}
