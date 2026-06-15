import 'package:flutter/material.dart';
import '../../data/repository.dart';
import '../../models/models.dart';
import '../../theme.dart';
import '../../widgets/common.dart';

class ConnectorsScreen extends StatelessWidget {
  final AmaraverseRepository repo;
  const ConnectorsScreen({super.key, required this.repo});

  @override
  Widget build(BuildContext context) {
    final items = repo.connectors();
    return CustomScrollView(slivers: [
      SliverToBoxAdapter(
        child: Padding(
          padding: const EdgeInsets.fromLTRB(20, 64, 20, 12),
          child: const SectionHeader(
            kicker: 'The data layer · 12 connectors',
            title: 'Every domain, as a live connector',
            subtitle: 'Governed, refreshable feeds with a defined schema, owner and cadence — the API surface of the twin.',
          ),
        ),
      ),
      SliverPadding(
        padding: const EdgeInsets.fromLTRB(20, 8, 20, 28),
        sliver: SliverList(
          delegate: SliverChildBuilderDelegate(
            (_, i) => Padding(
              padding: const EdgeInsets.only(bottom: 12),
              child: _ConnectorCard(c: items[i]),
            ),
            childCount: items.length,
          ),
        ),
      ),
    ]);
  }
}

class _ConnectorCard extends StatelessWidget {
  final Connector c;
  const _ConnectorCard({required this.c});

  @override
  Widget build(BuildContext context) {
    return GlassCard(
      accent: c.accent,
      onTap: () => showModalBottomSheet(
        context: context,
        backgroundColor: AppColors.bg2,
        showDragHandle: true,
        builder: (_) => _ConnectorSheet(c: c),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(children: [
            Container(
              width: 44, height: 44,
              decoration: BoxDecoration(
                color: Colors.white.withValues(alpha: 0.04),
                borderRadius: BorderRadius.circular(11),
                border: const Border.fromBorderSide(BorderSide(color: AppColors.line)),
              ),
              child: Icon(c.icon, color: c.accent, size: 22),
            ),
            const SizedBox(width: 14),
            Expanded(
              child: Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
                Text(c.entity.toUpperCase(), style: TextStyle(color: c.accent, fontSize: 10, letterSpacing: 1.2)),
                Text(c.title, style: const TextStyle(fontWeight: FontWeight.w600, fontSize: 15)),
              ]),
            ),
            const LivePill(),
          ]),
          const SizedBox(height: 12),
          Text(c.description, style: const TextStyle(color: AppColors.muted, fontSize: 13, height: 1.45)),
          const SizedBox(height: 14),
          // indicative reading gauge
          ClipRRect(
            borderRadius: BorderRadius.circular(6),
            child: LinearProgressIndicator(
              value: c.reading,
              minHeight: 6,
              backgroundColor: Colors.white.withValues(alpha: 0.06),
              valueColor: AlwaysStoppedAnimation(c.accent),
            ),
          ),
          const SizedBox(height: 14),
          Wrap(spacing: 6, runSpacing: 6, children: c.feeds.map((f) => Tag(f)).toList()),
        ],
      ),
    );
  }
}

class _ConnectorSheet extends StatelessWidget {
  final Connector c;
  const _ConnectorSheet({required this.c});
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.fromLTRB(22, 6, 22, 30),
      child: Column(mainAxisSize: MainAxisSize.min, crossAxisAlignment: CrossAxisAlignment.start, children: [
        Row(children: [
          Icon(c.icon, color: c.accent),
          const SizedBox(width: 10),
          Text(c.title, style: AppTheme.display(22)),
        ]),
        const SizedBox(height: 12),
        Text(c.description, style: const TextStyle(color: AppColors.muted, height: 1.5)),
        const SizedBox(height: 20),
        const Text('FEEDS', style: TextStyle(color: AppColors.muted2, fontSize: 11, letterSpacing: 1.6)),
        const SizedBox(height: 10),
        Wrap(spacing: 8, runSpacing: 8, children: c.feeds.map((f) => Tag(f)).toList()),
        const SizedBox(height: 22),
        SizedBox(
          width: double.infinity,
          child: FilledButton.icon(
            style: FilledButton.styleFrom(backgroundColor: c.accent, foregroundColor: Colors.black),
            onPressed: () {},
            icon: const Icon(Icons.api),
            label: const Text('Open API schema'),
          ),
        ),
        const SizedBox(height: 8),
        const Text('Indicative concept data — not an official feed.', style: TextStyle(color: AppColors.muted2, fontSize: 11)),
      ]),
    );
  }
}
