import 'package:flutter/material.dart';
import '../theme.dart';

/// Small, reusable, decoupled UI atoms shared across feature screens.

class SectionHeader extends StatelessWidget {
  final String kicker;
  final String title;
  final String? subtitle;
  const SectionHeader(
      {super.key, required this.kicker, required this.title, this.subtitle});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(kicker.toUpperCase(),
            style: const TextStyle(
                color: AppColors.saffron,
                fontSize: 11,
                letterSpacing: 2.4,
                fontWeight: FontWeight.w600)),
        const SizedBox(height: 8),
        Text(title, style: AppTheme.display(26)),
        if (subtitle != null) ...[
          const SizedBox(height: 8),
          Text(subtitle!,
              style: const TextStyle(color: AppColors.muted, height: 1.5)),
        ],
      ],
    );
  }
}

/// A premium glass-ish card with a colored top accent bar.
class GlassCard extends StatelessWidget {
  final Widget child;
  final Color accent;
  final EdgeInsets padding;
  final VoidCallback? onTap;
  const GlassCard(
      {super.key,
      required this.child,
      this.accent = AppColors.gold,
      this.padding = const EdgeInsets.all(18),
      this.onTap});

  @override
  Widget build(BuildContext context) {
    return Material(
      color: AppColors.surface,
      borderRadius: BorderRadius.circular(16),
      child: InkWell(
        onTap: onTap,
        borderRadius: BorderRadius.circular(16),
        child: Container(
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(16),
            border:
                const Border.fromBorderSide(BorderSide(color: AppColors.line)),
          ),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              Container(
                  height: 3,
                  decoration: BoxDecoration(
                      color: accent,
                      borderRadius: const BorderRadius.vertical(
                          top: Radius.circular(16)))),
              Padding(padding: padding, child: child),
            ],
          ),
        ),
      ),
    );
  }
}

class LivePill extends StatelessWidget {
  const LivePill({super.key});
  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 9, vertical: 4),
      decoration: BoxDecoration(
        color: AppColors.green.withValues(alpha: 0.14),
        borderRadius: BorderRadius.circular(20),
      ),
      child: const Row(mainAxisSize: MainAxisSize.min, children: [
        Icon(Icons.circle, size: 7, color: AppColors.green),
        SizedBox(width: 6),
        Text('LIVE',
            style: TextStyle(
                color: AppColors.green,
                fontSize: 9,
                letterSpacing: 1.4,
                fontWeight: FontWeight.w700)),
      ]),
    );
  }
}

class Tag extends StatelessWidget {
  final String label;
  const Tag(this.label, {super.key});
  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 4),
      decoration: BoxDecoration(
        color: Colors.white.withValues(alpha: 0.04),
        borderRadius: BorderRadius.circular(20),
        border: const Border.fromBorderSide(BorderSide(color: AppColors.line)),
      ),
      child: Text(label,
          style: const TextStyle(fontSize: 11, color: AppColors.text)),
    );
  }
}
