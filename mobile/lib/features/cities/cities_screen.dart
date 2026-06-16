import 'package:flutter/material.dart';
import '../../data/repository.dart';
import '../../theme.dart';
import '../../widgets/common.dart';

class CitiesScreen extends StatelessWidget {
  final AmaraverseRepository repo;
  const CitiesScreen({super.key, required this.repo});

  @override
  Widget build(BuildContext context) {
    final cities = repo.cities();
    return AdaptiveContent(
        child: CustomScrollView(slivers: [
      const SliverToBoxAdapter(
        child: Padding(
          padding: EdgeInsets.fromLTRB(20, 64, 20, 12),
          child: SectionHeader(
            kicker: 'The spatial layer · 9 cities + Quantum Valley',
            title: 'A polycentric capital',
            subtitle:
                'Each theme city is a 3D zone with its own connectors filtered in.',
          ),
        ),
      ),
      SliverPadding(
        padding: const EdgeInsets.fromLTRB(20, 8, 20, 28),
        sliver: SliverGrid(
          gridDelegate: adaptiveGrid(maxExtent: 220, aspect: 0.92),
          delegate: SliverChildBuilderDelegate(
            (_, i) {
              final c = cities[i];
              return GlassCard(
                accent: c.color,
                child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Container(
                          width: 14,
                          height: 14,
                          decoration: BoxDecoration(
                            color: c.color,
                            borderRadius: BorderRadius.circular(4),
                            boxShadow: [
                              BoxShadow(
                                  color: c.color.withValues(alpha: 0.6),
                                  blurRadius: 12)
                            ],
                          )),
                      const SizedBox(height: 12),
                      Text(c.title,
                          style: const TextStyle(
                              fontWeight: FontWeight.w600, fontSize: 14)),
                      const SizedBox(height: 8),
                      Text(c.description,
                          style: const TextStyle(
                              color: AppColors.muted,
                              fontSize: 12,
                              height: 1.4)),
                      const Spacer(),
                      Row(children: [
                        const Icon(Icons.dataset,
                            size: 13, color: AppColors.muted2),
                        const SizedBox(width: 5),
                        Text('${c.datasets} datasets',
                            style: const TextStyle(
                                color: AppColors.muted2, fontSize: 11)),
                      ]),
                    ]),
              );
            },
            childCount: cities.length,
          ),
        ),
      ),
    ]));
  }
}
