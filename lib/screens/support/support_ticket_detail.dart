import 'package:flutter/material.dart';
import '../../models/ticket.dart';
import '../../services/api_service.dart';

class SupportTicketDetail extends StatefulWidget {
  final int ticketId;
  const SupportTicketDetail({super.key, required this.ticketId});

  @override
  State<SupportTicketDetail> createState() => _SupportTicketDetailState();
}

class _SupportTicketDetailState extends State<SupportTicketDetail> {
  late Future<Ticket> _futureTicket;

  @override
  void initState() {
    super.initState();
    _futureTicket = ApiService.fetchTicketById(widget.ticketId);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Support — Ticket Detail'),
      ),
      body: FutureBuilder<Ticket>(
        future: _futureTicket,
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            return const Center(child: CircularProgressIndicator());
          } else if (snapshot.hasError) {
            return Center(child: Text('Error: ${snapshot.error}'));
          } else if (!snapshot.hasData) {
            return const Center(child: Text('Ticket not found'));
          }

          final t = snapshot.data!;
          return Padding(
            padding: const EdgeInsets.all(16.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(t.title, style: Theme.of(context).textTheme.headlineSmall),
                const SizedBox(height: 8),
                Text('Ticket #${t.id} — User ${t.userId}'),
                const SizedBox(height: 16),
                Text(t.body),
                const SizedBox(height: 24),
                ElevatedButton(
                  onPressed: () {
                    Navigator.of(context).pop();
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
