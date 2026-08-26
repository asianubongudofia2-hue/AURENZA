import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:url_strategy/url_strategy.dart';

import 'screens/users_list.dart';
import 'screens/user_detail.dart';
import 'screens/admin/admin_dashboard.dart';
import 'screens/admin/admin_users_list.dart';
import 'screens/admin/admin_user_detail.dart';
import 'screens/support/support_dashboard.dart';
import 'screens/support/support_tickets_list.dart';
import 'screens/support/support_ticket_detail.dart';

void main() {
  // Remove the hash (#) from Flutter web URLs
  setPathUrlStrategy();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    final GoRouter _router = GoRouter(
      initialLocation: '/users',
      routes: <RouteBase>[
        GoRoute(
          path: '/',
          builder: (context, state) => const UsersList(),
        ),
        GoRoute(
          path: '/users',
          name: 'users',
          builder: (context, state) => const UsersList(),
        ),
        GoRoute(
          path: '/users/:id',
          name: 'user_detail',
          builder: (context, state) {
            final id = state.params['id']!;
            return UserDetail(userId: int.parse(id));
          },
        ),
        // Admin section with nested routes
        GoRoute(
          path: '/admin',
          name: 'admin',
          builder: (context, state) => const AdminDashboard(),
          routes: [
            GoRoute(
              path: 'users',
              name: 'admin_users',
              builder: (context, state) => const AdminUsersList(),
            ),
            GoRoute(
              path: 'users/:id',
              name: 'admin_user_detail',
              builder: (context, state) {
                final id = state.params['id']!;
                return AdminUserDetail(userId: int.parse(id));
              },
            ),
          ],
        ),
        // Support section with nested routes
        GoRoute(
          path: '/support',
          name: 'support',
          builder: (context, state) => const SupportDashboard(),
          routes: [
            GoRoute(
              path: 'tickets',
              name: 'support_tickets',
              builder: (context, state) => const SupportTicketsList(),
            ),
            GoRoute(
              path: 'tickets/:id',
              name: 'support_ticket_detail',
              builder: (context, state) {
                final id = state.params['id']!;
                return SupportTicketDetail(ticketId: int.parse(id));
              },
            ),
          ],
        ),
      ],
      errorBuilder: (context, state) => Scaffold(
        appBar: AppBar(title: const Text('AURENZA')),
        body: Center(child: Text(state.error.toString())),
      ),
    );

    return MaterialApp.router(
      title: 'AURENZA',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      routerConfig: _router,
    );
  }
}
