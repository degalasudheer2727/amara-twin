import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:amara_twin/data/repository.dart';
import 'package:amara_twin/features/home/home_screen.dart';

void main() {
  const repo = MockRepository();

  test('repository exposes the full concept dataset', () {
    expect(repo.kpis().length, 4);
    expect(repo.connectors().length, 12);
    expect(repo.cities().length, 10); // 9 theme cities + Quantum Valley
    expect(repo.pillars().length, 4);
    expect(repo.futures(), isNotEmpty);
    expect(repo.twinUrl, startsWith('https://'));
  });

  testWidgets('Home screen renders headline and KPIs', (tester) async {
    // The home screen is a lazy CustomScrollView; give the test a tall surface
    // so every sliver (headline, KPIs, pillars) is laid out and findable.
    tester.view.physicalSize = const Size(1200, 3200);
    tester.view.devicePixelRatio = 1.0;
    addTearDown(tester.view.reset);

    await tester.pumpWidget(
        const MaterialApp(home: Scaffold(body: HomeScreen(repo: repo))));
    expect(find.textContaining('Capital'), findsWidgets);
    expect(find.textContaining('national-grade'), findsOneWidget);
  });
}
