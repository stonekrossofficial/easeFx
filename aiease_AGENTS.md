# AGENTS.md — Flutter Development Rules
> Stack: Flutter (iOS + Android) · BLoC · GetIt + Injectable · Dio · Freezed · fpdart

---

## Architecture
- Clean Architecture: `data → domain → presentation`, one folder per feature
- `domain/` is pure Dart — no Flutter, no Dio, no JSON imports ever
- Models live in `data/`, Entities in `domain/`, never mix them
- Add a `toEntity()` extension on every Model to convert to Entity

---

## Dependency Injection (GetIt + Injectable)
- `@singleton` → DioClient, Router
- `@LazySingleton` → Repositories, DataSources
- `@injectable` → UseCases, BLoCs
- Never call `getIt<>` inside a BLoC, Widget, or UseCase — provide BLoCs via `BlocProvider` in the router

---

## BLoC
- Events and States must use **Freezed unions**
- Always `emit(loading)` before any async call
- Always use `result.fold(failure, success)` — never unwrap without handling failure
- Use `Bloc` for features, `Cubit` only for simple UI toggles (e.g. password visibility)
- One BLoC per feature — never a god BLoC
- Never use `BuildContext` inside a BLoC
- Handle **all** Freezed state variants in every `BlocBuilder` / `BlocSelector`
- Use `BlocSelector` when only one field from state is needed — avoids full rebuilds

---

## Error Handling
- DataSources **throw** `Exception` subclasses (`ServerException`, `NetworkException`, etc.)
- Repositories **catch** those and return `Either<AppFailure, T>` — never let raw exceptions leak
- `AppFailure` is a Freezed union: `server | cache | network | unauthorized | unknown`
- Always check connectivity before making a network call in the repository
- Never catch silently — always `AppLogger.error()` before returning a failure
- Always show an `AppErrorWidget` (with retry) for failure states in the UI

---

## Responsiveness
- Base design ref: 390×844 (iPhone 14) — use `AppDimensions` helpers, never hardcoded px
- Use `LayoutBuilder` for widget-level branching, `MediaQuery` for page-level
- Clamp system text scale to `0.8–1.2` in `MaterialApp.builder`
- Wrap every page body in `SafeArea`
- Use `context.isSmallPhone` / `context.isLargePhone` extensions for layout decisions

---

## Performance (Buttery Smooth)
- All static widgets **must** use `const` constructors
- Always `ListView.builder` — never `ListView(children: [...])` for dynamic data
- Provide `itemExtent` on `ListView.builder` when all items have the same height
- Use `cached_network_image` — never `Image.network`; always set `memCacheWidth/Height`
- Use `RepaintBoundary` around independently animating widgets
- Use `FadeTransition` / `AnimatedOpacity` — never the `Opacity` widget for animations
- Avoid `ClipRRect` inside list items — use `BoxDecoration` with `borderRadius` instead
- Use `compute()` for JSON parsing lists > 50 items
- Dispose every `AnimationController`, `ScrollController`, `TextEditingController`
- Show shimmer/skeleton during loading — never a blank screen or raw spinner

---

## Animations
- Micro feedback (tap): 100–150ms, `Curves.easeOut`
- Page transitions: 250–300ms, `Curves.easeInOutCubic`
- Bottom sheets: 280–320ms, `Curves.easeOutCubic`
- Use `AnimatedBuilder` with a static `child` — never `setState` to drive animations
- Use `AnimatedSwitcher` for state-driven content swaps

---

## Network
- One `DioClient` singleton with interceptors: Auth → Retry → Logging (debug only) → Error
- Error interceptor maps all `DioException` types to typed `Exception` subclasses
- API calls only in DataSources — never in BLoC or UseCase
- Timeouts: connect 15s, receive 15s

---

## Models & Entities
- Models: Freezed + JsonSerializable, live in `data/`
- Entities: plain Dart + Equatable, live in `domain/`
- Use `@JsonKey(name: 'snake_case')` for field mapping — never rename the Dart field

---

## Logging
- Use `AppLogger` everywhere — never `print()`
- Register `AppBlocObserver` in `main.dart` to log all BLoC events/state transitions in debug
- Never log tokens, passwords, or PII

---

## Code Generation
```bash
flutter pub run build_runner build --delete-conflicting-outputs
```
Never manually edit `*.freezed.dart`, `*.g.dart`, or `injection.config.dart`

---

## Required Packages
```yaml
flutter_bloc, bloc, get_it, injectable, dio, connectivity_plus,
fpdart, freezed_annotation, json_annotation, equatable,
flutter_secure_storage, shared_preferences, go_router,
cached_network_image, shimmer, flutter_animate, logger
```

---

## Hard NO's
- `print()` → use `AppLogger`
- `Image.network` → use `cached_network_image`
- `Opacity` widget for animation → use `FadeTransition`
- `ClipRRect` inside list items
- `ListView(children: [...])` for dynamic data
- `getIt<>` inside BLoC / Widget / UseCase
- Business logic in Widgets
- Raw exceptions leaking out of Repositories
- Missing `dispose()` on any controller
- Hardcoded pixel values for layout
