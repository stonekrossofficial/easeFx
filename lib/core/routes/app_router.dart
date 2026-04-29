import 'package:go_router/go_router.dart';
import 'package:easefx_ai/features/onboarding/presentation/pages/splash_page.dart';
import 'package:easefx_ai/features/onboarding/presentation/pages/onboarding_page.dart';
import 'package:easefx_ai/features/home/presentation/pages/home_page.dart';
import 'package:easefx_ai/features/editor/presentation/pages/editor_page.dart';
import 'package:easefx_ai/features/editor/presentation/pages/processing_page.dart';
import 'package:easefx_ai/features/editor/presentation/pages/result_page.dart';
import 'package:easefx_ai/features/creations/presentation/pages/my_creations_page.dart';
import 'package:easefx_ai/features/ai_filters/presentation/pages/ai_filters_page.dart';
import 'package:easefx_ai/features/hair_swap/presentation/pages/hair_swap_page.dart';
import 'package:easefx_ai/features/headshot_generator/presentation/pages/headshot_generator_page.dart';
import 'package:easefx_ai/features/headshot_generator/presentation/bloc/headshot_generator_bloc.dart';
import 'package:easefx_ai/features/text_to_image/presentation/pages/text_to_image_page.dart';
import 'package:easefx_ai/features/creations/presentation/pages/image_preview_page.dart';
import 'package:easefx_ai/features/kontext_flux/presentation/pages/kontext_flux_page.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:easefx_ai/injection.dart';

final GoRouter appRouter = GoRouter(
  initialLocation: '/',
  routes: [
    GoRoute(
      path: '/',
      builder: (context, state) => const SplashPage(),
    ),
    GoRoute(
      path: '/onboarding',
      builder: (context, state) => const OnboardingPage(),
    ),
    GoRoute(
      path: '/home',
      builder: (context, state) => const HomePage(),
    ),
    GoRoute(
      path: '/editor',
      builder: (context, state) => const EditorPage(),
    ),
    GoRoute(
      path: '/ai-filters',
      builder: (context, state) => const AiFiltersPage(),
    ),
    GoRoute(
      path: '/hair-swap',
      builder: (context, state) => const HairSwapPage(),
    ),
    GoRoute(
      path: '/headshot',
      builder: (context, state) {
        return BlocProvider(
          create: (context) => getIt<HeadshotGeneratorBloc>(),
          child: const HeadshotGeneratorPage(),
        );
      },
    ),
    GoRoute(
      path: '/processing',
      builder: (context, state) => const ProcessingPage(),
    ),
    GoRoute(
      path: '/result',
      builder: (context, state) {
        final extraData = state.extra as Map<String, dynamic>?;
        return ResultPage(extraData: extraData);
      },
    ),
    GoRoute(
      path: '/creations',
      builder: (context, state) => const MyCreationsPage(),
    ),
    GoRoute(
      path: '/text-to-image',
      builder: (context, state) => const TextToImagePage(),
    ),
    GoRoute(
      path: '/image-preview',
      builder: (context, state) {
        final imageUrl = state.extra as String;
        return ImagePreviewPage(imageUrl: imageUrl);
      },
    ),
    GoRoute(
      path: '/kontext-flux',
      builder: (context, state) => const KontextFluxPage(),
    ),
  ],
);
