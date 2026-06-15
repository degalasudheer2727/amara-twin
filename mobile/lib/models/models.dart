import 'package:flutter/material.dart';

/// Immutable domain models for AMARATWIN. Pure data — no UI, no IO.
/// Keeping these decoupled lets the repository swap mock data for a real
/// open-data API later without touching the feature screens.

@immutable
class Kpi {
  final String value;
  final String unit;
  final String label;
  const Kpi(this.value, this.unit, this.label);
}

@immutable
class Pillar {
  final String number;
  final String title;
  final String description;
  final Color accent;
  const Pillar(this.number, this.title, this.description, this.accent);
}

@immutable
class Connector {
  final String entity;
  final String title;
  final String description;
  final IconData icon;
  final List<String> feeds;
  final Color accent;
  final double reading; // 0..1 indicative live value for the gauge
  const Connector({
    required this.entity,
    required this.title,
    required this.description,
    required this.icon,
    required this.feeds,
    required this.accent,
    this.reading = 0.7,
  });
}

@immutable
class ThemeCity {
  final String title;
  final String telugu;
  final String description;
  final Color color;
  final int datasets;
  const ThemeCity(
      this.title, this.telugu, this.description, this.color, this.datasets);
}

@immutable
class FutureFeature {
  final String horizon; // e.g. "2030", "2035", "2040"
  final String title;
  final String description;
  final IconData icon;
  final Color accent;
  const FutureFeature({
    required this.horizon,
    required this.title,
    required this.description,
    required this.icon,
    required this.accent,
  });
}

@immutable
class Signal {
  final String label;
  final String value;
  const Signal(this.label, this.value);
}
