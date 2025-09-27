import 'package:flutter/material.dart';

class OperationsPage1 extends StatefulWidget {
  const OperationsPage1({super.key});

  @override
  State<OperationsPage1> createState() => _OperationsPage1State();
}

class _OperationsPage1State extends State<OperationsPage1> {
  final TextEditingController _search = TextEditingController();

  // ---- Dummy data (bisa diganti dari API) ----
  final List<WarehouseSection> _sections = [
    WarehouseSection(
      name: 'Gudang Surabaya',
      items: [
        OperationItem(title: 'RECEIPTS', count: 4),
        OperationItem(title: 'DELIVERY ORDERS', count: 16),
        OperationItem(title: 'MANUFACTURING', count: 2),
        OperationItem(title: 'POS ORDERS', count: 0),
      ],
    ),
    WarehouseSection(
      name: 'Gudang Kediri',
      items: [
        OperationItem(title: 'RECEIPTS', count: 4),
        OperationItem(title: 'DELIVERY ORDERS', count: 16),
        OperationItem(title: 'MANUFACTURING', count: 1),
        OperationItem(title: 'POS ORDERS', count: 3),
      ],
    ),
  ];

  String _q = '';

  @override
  void dispose() {
    _search.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final Color badgeColor = const Color(0xFF6B4A63);

    return Scaffold(
      appBar: AppBar(
        backgroundColor: badgeColor,
        foregroundColor: Colors.white,
        centerTitle: true,
        title: const Text('Operations'),
        leading: IconButton(
          icon: const Icon(Icons.arrow_back_ios_new_rounded),
          onPressed: () => Navigator.maybePop(context),
        ),
      ),
      body: ListView(
        padding: const EdgeInsets.fromLTRB(12, 16, 12, 24),
        children: [
          _TipBanner(),
          const SizedBox(height: 12),
          TextField(
            controller: _search,
            onChanged: (v) => setState(() => _q = v.trim().toLowerCase()),
            decoration: const InputDecoration(
              hintText: 'Search...',
              prefixIcon: Icon(Icons.search),
            ),
          ),
          const SizedBox(height: 16),
          ..._sections.map((s) {
            final filtered = _filterItems(s.items, _q);
            final isHidden = _q.isNotEmpty && filtered.isEmpty;
            if (isHidden) return const SizedBox.shrink();

            return Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(s.name, style: Theme.of(context).textTheme.titleMedium),
                const SizedBox(height: 8),
                ...filtered.map((it) => _OperationTile(item: it, badgeColor: badgeColor)),
                const SizedBox(height: 12),
              ],
            );
          }),
        ],
      ),
    );
  }

  List<OperationItem> _filterItems(List<OperationItem> items, String q) {
    if (q.isEmpty) return items;
    return items.where((e) => e.title.toLowerCase().contains(q)).toList();
  }
}

class _TipBanner extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: const Color(0xFFE8F3F8),
        borderRadius: BorderRadius.circular(14),
      ),
      padding: const EdgeInsets.all(12),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const Icon(Icons.info_outline_rounded, size: 20),
          const SizedBox(width: 8),
          Expanded(
            child: Text(
              'Determine the type of warehouse activity being performed when using a barcode scanner.',
              style: Theme.of(context).textTheme.bodySmall,
            ),
          ),
        ],
      ),
    );
  }
}

class _OperationTile extends StatelessWidget {
  final OperationItem item;
  final Color badgeColor;
  const _OperationTile({required this.item, required this.badgeColor});

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.only(bottom: 10),
      decoration: BoxDecoration(
        border: Border.all(color: Theme.of(context).dividerColor),
        borderRadius: BorderRadius.circular(14),
        color: Colors.white,
      ),
      child: ListTile(
        contentPadding: const EdgeInsets.symmetric(horizontal: 14, vertical: 2),
        title: Text(
          item.title,
          style: Theme.of(context).textTheme.bodyMedium?.copyWith(fontWeight: FontWeight.w600),
        ),
        trailing: Container(
          padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 6),
          decoration: BoxDecoration(
            color: badgeColor,
            borderRadius: BorderRadius.circular(999),
          ),
          child: Text(
            '${item.count}',
            style: const TextStyle(color: Colors.white, fontWeight: FontWeight.bold),
          ),
        ),
        onTap: () {
          // TODO: arahkan ke halaman detail sesuai item
          ScaffoldMessenger.of(context).showSnackBar(
            SnackBar(content: Text('Open ${item.title}')),
          );
        },
      ),
    );
  }
}

// ---- Model sederhana ----
class WarehouseSection {
  final String name;
  final List<OperationItem> items;
  WarehouseSection({required this.name, required this.items});
}

class OperationItem {
  final String title;
  final int count;
  OperationItem({required this.title, required this.count});
}
