import 'package:flutter/material.dart';
import '../../theme.dart';
import '../../widgets/common.dart';

class ProfileScreen extends StatelessWidget {
  const ProfileScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final rows = <(IconData, String, String)>[
      (Icons.language, 'Language', 'English · తెలుగు'),
      (Icons.notifications_active, 'Civic alerts', 'On'),
      (Icons.location_city, 'My ward', 'Government City'),
      (Icons.cloud_off, 'Offline twin', 'Cached'),
      (Icons.shield_moon, 'Privacy & consent', 'Consent-first'),
      (Icons.info_outline, 'About AMARATWIN', 'Concept v1.0'),
    ];
    return ListView(
      padding: const EdgeInsets.fromLTRB(20, 64, 20, 28),
      children: [
        const SectionHeader(kicker: 'You', title: 'Your capital'),
        const SizedBox(height: 18),
        GlassCard(
          accent: AppColors.saffron,
          child: Row(children: [
            const CircleAvatar(
                radius: 26,
                backgroundColor: AppColors.surfaceHi,
                child: Icon(Icons.person, color: AppColors.gold)),
            const SizedBox(width: 14),
            Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
              Text('Citizen', style: AppTheme.display(18)),
              const SizedBox(height: 2),
              const Text('Decentralised Digital ID · verified',
                  style: TextStyle(color: AppColors.muted, fontSize: 12)),
            ]),
          ]),
        ),
        const SizedBox(height: 16),
        ...rows.map((r) => Padding(
              padding: const EdgeInsets.only(bottom: 10),
              child: GlassCard(
                accent: AppColors.line,
                padding:
                    const EdgeInsets.symmetric(horizontal: 16, vertical: 14),
                child: Row(children: [
                  Icon(r.$1, size: 20, color: AppColors.muted),
                  const SizedBox(width: 14),
                  Expanded(
                      child: Text(r.$2, style: const TextStyle(fontSize: 14))),
                  Text(r.$3,
                      style: const TextStyle(
                          color: AppColors.muted2, fontSize: 12)),
                  const SizedBox(width: 6),
                  const Icon(Icons.chevron_right,
                      size: 18, color: AppColors.muted2),
                ]),
              ),
            )),
        const SizedBox(height: 12),
        const Text(
          'Concept prototype — not an official Government of Andhra Pradesh or APCRDA product, and not endorsed by either. All figures indicative.',
          style: TextStyle(color: AppColors.muted2, fontSize: 11, height: 1.6),
        ),
      ],
    );
  }
}
