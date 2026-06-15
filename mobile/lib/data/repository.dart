import 'package:flutter/material.dart';
import '../models/models.dart';
import '../theme.dart';

/// Decoupled data access. Screens depend on [AmaraverseRepository] (the
/// abstraction), never on a concrete source. Today it returns governed mock
/// data; swap [MockRepository] for an `ApiRepository` to go live without
/// changing a single feature screen.
abstract class AmaraverseRepository {
  List<Kpi> kpis();
  List<Pillar> pillars();
  List<Connector> connectors();
  List<ThemeCity> cities();
  List<FutureFeature> futures();
  List<Signal> liveSignals();

  /// The live 3D digital-twin web experience embedded by the Twin screen.
  /// Hosted on Vercel in production; falls back to the bundled asset offline.
  String get twinUrl;
}

class MockRepository implements AmaraverseRepository {
  const MockRepository();

  @override
  String get twinUrl => 'https://amara-twin.vercel.app/';

  @override
  List<Kpi> kpis() => const [
        Kpi('217', ' km²', 'Master-plan capital region'),
        Kpi('9', '', 'Specialised theme cities'),
        Kpi('1.2', 'k+', 'Indicative open datasets'),
        Kpi('3.5', 'M', 'Projected residents by 2050'),
      ];

  @override
  List<Pillar> pillars() => const [
        Pillar('01', 'Statistical Reference',
            'The single source of truth for population, land, economy and infrastructure baselines.', AppColors.saffron),
        Pillar('02', 'Open Data Portal',
            'Public, machine-readable datasets with licences, schemas and APIs anyone can build on.', AppColors.green),
        Pillar('03', 'Secure Data Exchange',
            'Governed sharing between agencies and partners with consent and audit trails.', AppColors.pulse),
        Pillar('04', 'Analytics & Foresight',
            'Dashboards, scenario models and AI forecasts that turn the twin into decisions.', AppColors.gold),
      ];

  @override
  List<Connector> connectors() => const [
        Connector(entity: 'Governance', title: 'Civic Pulse', description: 'Service requests, permits and citizen sentiment.', icon: Icons.balance, feeds: ['Grievances', 'Permits', 'e-Services'], accent: AppColors.saffron, reading: 0.78),
        Connector(entity: 'Quantum', title: 'Quantum Valley', description: 'Compute capacity, research output and deep-tech activity.', icon: Icons.hub, feeds: ['Compute', 'R&D', 'Startups'], accent: AppColors.cyan, reading: 0.38),
        Connector(entity: 'Mobility', title: 'Move Amaravati', description: 'Transit, traffic flow, EV charging and road network.', icon: Icons.directions_transit, feeds: ['Transit', 'Traffic', 'EV'], accent: AppColors.pulse, reading: 0.62),
        Connector(entity: 'Water', title: 'River & Grid', description: 'Krishna riverfront levels, reservoirs and flood resilience.', icon: Icons.water_drop, feeds: ['River', 'Supply', 'Flood'], accent: Color(0xFF3AA0FF), reading: 0.96),
        Connector(entity: 'Energy', title: 'Green Power', description: 'Solar generation, grid load and renewables mix.', icon: Icons.bolt, feeds: ['Solar', 'Grid', 'Demand'], accent: AppColors.gold, reading: 0.71),
        Connector(entity: 'Housing', title: 'Live Here', description: 'Housing stock, affordability and neighbourhood build-out.', icon: Icons.holiday_village, feeds: ['Stock', 'Pricing', 'Build-out'], accent: Color(0xFFC98BFF), reading: 0.55),
        Connector(entity: 'Economy', title: 'Capital Markets', description: 'Investment, jobs, GVA and sectoral growth.', icon: Icons.trending_up, feeds: ['Jobs', 'FDI', 'GVA'], accent: AppColors.green, reading: 0.66),
        Connector(entity: 'Demographics', title: 'People & Place', description: 'Population, density and the human texture of each ward.', icon: Icons.groups, feeds: ['Census', 'Density', 'Wards'], accent: Color(0xFFFF7A7A), reading: 0.6),
        Connector(entity: 'Construction', title: 'Build Watch', description: 'Live progress on the government spine and capital works.', icon: Icons.construction, feeds: ['Projects', 'Progress', 'Spend'], accent: Color(0xFFFFB347), reading: 0.64),
        Connector(entity: 'Environment', title: 'Air & Green', description: 'Air quality, green cover and the blue-green network.', icon: Icons.eco, feeds: ['AQI', 'Canopy', 'Parks'], accent: Color(0xFF5AD17A), reading: 0.83),
        Connector(entity: 'Heritage', title: 'Amara Roots', description: 'Buddhist heritage, the stupa and cultural memory.', icon: Icons.account_balance, feeds: ['Sites', 'Tourism', 'Archive'], accent: AppColors.maroon, reading: 0.5),
        Connector(entity: 'Safety', title: 'Safe City', description: 'Emergency response, disaster readiness and safety signals.', icon: Icons.shield, feeds: ['112', 'Disaster', 'CCTV'], accent: Color(0xFFFF5F6D), reading: 0.9),
      ];

  @override
  List<ThemeCity> cities() => const [
        ThemeCity('Government City', 'పరిపాలన నగరం', 'The legislative & administrative spine.', AppColors.saffron, 142),
        ThemeCity('Justice City', 'న్యాయ నగరం', 'High Court & judicial precinct.', AppColors.gold, 64),
        ThemeCity('Finance City', 'ఆర్థిక నగరం', 'Banking, markets & capital.', AppColors.green, 88),
        ThemeCity('Knowledge City', 'విజ్ఞాన నగరం', 'Universities & research.', AppColors.pulse, 121),
        ThemeCity('Health City', 'ఆరోగ్య నగరం', 'Hospitals & life sciences.', Color(0xFFFF5F6D), 77),
        ThemeCity('Sports City', 'క్రీడా నగరం', 'Stadia & athletic venues.', AppColors.cyan, 39),
        ThemeCity('Media City', 'మీడియా నగరం', 'Film, broadcast & creative.', Color(0xFFC98BFF), 45),
        ThemeCity('Tourism City', 'పర్యాటక నగరం', 'Riverfront, culture & leisure.', Color(0xFFFFB347), 58),
        ThemeCity('Electronics City', 'ఎలక్ట్రానిక్స్ నగరం', 'Manufacturing & deep-tech.', Color(0xFF5AD17A), 83),
        ThemeCity('Quantum Valley', 'క్వాంటం వ్యాలీ', 'Quantum compute & frontier R&D.', Color(0xFF7AD0FF), 96),
      ];

  /// Forward-looking capability roadmap — the digital city of 2040.
  @override
  List<FutureFeature> futures() => const [
        FutureFeature(horizon: '2030', title: 'AI Civic Co-pilot', description: 'A multilingual assistant that answers any question about the city and files services for you.', icon: Icons.auto_awesome, accent: AppColors.saffron),
        FutureFeature(horizon: '2030', title: 'Decentralised Digital ID', description: 'Self-sovereign identity & verifiable credentials for every resident, consent-first.', icon: Icons.badge, accent: AppColors.pulse),
        FutureFeature(horizon: '2032', title: 'CBDC & Programmable Payments', description: 'e-Rupee wallet for fees, subsidies and micro-payments built into the city OS.', icon: Icons.payments, accent: AppColors.green),
        FutureFeature(horizon: '2033', title: 'Autonomous Mobility Mesh', description: 'Self-driving shuttles, drone logistics and a unified MaaS booking layer.', icon: Icons.smart_toy, accent: AppColors.cyan),
        FutureFeature(horizon: '2035', title: 'AR Twin Overlay', description: 'Point your phone or glasses at any street and see live data painted onto reality.', icon: Icons.view_in_ar, accent: AppColors.gold),
        FutureFeature(horizon: '2035', title: 'Predictive Governance', description: 'The twin forecasts floods, congestion and demand and pre-positions resources.', icon: Icons.insights, accent: Color(0xFFC98BFF)),
        FutureFeature(horizon: '2036', title: 'Net-Zero Energy Twin', description: 'Real-time carbon ledger; every building, grid and vehicle optimised to net-zero.', icon: Icons.energy_savings_leaf, accent: Color(0xFF5AD17A)),
        FutureFeature(horizon: '2038', title: 'Quantum-Secured Exchange', description: 'Post-quantum cryptography securing every inter-agency data transaction.', icon: Icons.lock, accent: Color(0xFF7AD0FF)),
        FutureFeature(horizon: '2040', title: 'Sentient City OS', description: 'A federated, privacy-preserving AI orchestrating the whole capital in real time.', icon: Icons.psychology, accent: AppColors.maroon),
        FutureFeature(horizon: '2040', title: 'Citizen DAO Budgeting', description: 'Residents co-allocate participatory budgets on-chain, ward by ward.', icon: Icons.how_to_vote, accent: Color(0xFFFFB347)),
      ];

  @override
  List<Signal> liveSignals() => const [
        Signal('Krishna riverfront level', '12.4 m'),
        Signal('Quantum compute utilised', '38%'),
        Signal('Government spine works', '64%'),
        Signal('Capital-region AQI', '217 · Good'),
        Signal('Solar generation today', '1.9 GWh'),
        Signal('Open datasets published', '1,240'),
        Signal('Transit ridership w/w', '+6.2%'),
        Signal('Green canopy cover', '31%'),
      ];
}
