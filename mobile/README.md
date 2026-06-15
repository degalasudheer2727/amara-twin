# AMARATWIN — Flutter hybrid app

The mobile companion to the Amaravati digital twin. Hybrid by design: native shell +
the live 3D web twin embedded via WebView, so the 3D experience has one source of truth.

## Run

```bash
flutter pub get
flutter run            # device or emulator
flutter test           # unit + widget tests
flutter analyze        # static analysis
```

## Structure (decoupled)

```
lib/
├─ main.dart            # entrypoint
├─ app.dart             # composition root — swap the repository here to go live
├─ theme.dart           # brand system (shared palette with the website)
├─ root_nav.dart        # bottom-nav shell (IndexedStack keeps the WebView alive)
├─ models/models.dart   # immutable domain models (no UI, no IO)
├─ data/repository.dart # AmaraverseRepository abstraction + MockRepository
├─ widgets/common.dart  # shared UI atoms
└─ features/
   ├─ home/        # KPIs, live signals, four pillars
   ├─ connectors/  # 12 data connectors + detail sheet
   ├─ twin/        # the live 3D digital twin (WebView)
   ├─ cities/      # 9 theme cities + Quantum Valley
   ├─ futures/     # the 2040 capability roadmap (timeline)
   └─ profile/     # identity, language, consent
```

## Going live

Implement `AmaraverseRepository` against your open-data API as `ApiRepository`, then
change one line in `lib/app.dart`. No screen depends on the data source.
