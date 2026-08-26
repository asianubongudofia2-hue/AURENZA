import 'package:flutter/material.dart';
import '../../models/ticket.dart';
import '../../services/api_service.dart';
import 'package:go_router/go_router.dart';

class SupportTicketsList extends StatefulWidget {
  const SupportTicketsList({super.key});

  @override
  State<SupportTicketsList> createState() => _SupportTicketsListState();
}

class _SupportTicketsListState extends State<SupportTicketsList> {
  late Future<List<Ticket>> _futureTickets;

  @override
  void initState() {
    super.initState();
    _futureTickets = ApiService.fetchTickets();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Support — Tickets'),
      ),
      body: FutureBuilder<List<Ticket>>(
        future: _futureTickets,
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            return const Center(child: CircularProgressIndicator());
          } else if (snapshot.hasError) {
            return Center(child: Text('Error: ${snapshot.error}'));
          } else if (!snapshot.hasData || snapshot.data!.isEmpty) {
            return const Center(child: Text('No tickets found'));
          }

          final tickets = snapshot.data!;
          return ListView.separated(
            itemCount: tickets.length,
            separatorBuilder: (context, index) => const Divider(height: 1),
            itemBuilder: (context, index) {
              final t = tickets[index];
              return ListTile(
                title: Text(t.title),
                subtitle: Text('Ticket #${t.id} — User ${t.userId}'),
                trailing: const Icon(Icons.chevron_right),
                onTap: () {
                  context.go('/support/tickets/${t.id}');
                },
              );
            },
          );
        },
      ),
    );
  }
}
