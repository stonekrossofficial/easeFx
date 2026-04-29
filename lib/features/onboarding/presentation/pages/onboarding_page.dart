import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:easefx_ai/core/theme/app_theme.dart';
import 'package:easefx_ai/core/widgets/neon_button.dart';

class OnboardingPage extends StatefulWidget {
  const OnboardingPage({super.key});
  @override
  State<OnboardingPage> createState() => _OnboardingPageState();
}

class _OnboardingPageState extends State<OnboardingPage> {
  final PageController _ctrl = PageController();
  int _page = 0;

  final _pages = const [
    {'icon': Icons.auto_awesome, 'title': 'AI Magic in One Tap', 'desc': 'Instantly enhance, style, and transform your photos with AI.'},
    {'icon': Icons.monetization_on, 'title': 'Premium. Zero Cost.', 'desc': 'Professional-grade AI filters without heavy subscriptions.'},
    {'icon': Icons.share, 'title': 'Create & Share', 'desc': 'Export in HD and share directly to your favourite platforms.'},
  ];

  Future<void> _skip() async {
    final prefs = await SharedPreferences.getInstance();
    await prefs.setBool('has_seen_onboarding', true);
    if (mounted) context.go('/home');
  }

  Future<void> _next() async {
    if (_page < _pages.length - 1) {
      _ctrl.nextPage(duration: const Duration(milliseconds: 280), curve: Curves.easeInOut);
    } else {
      await _skip();
    }
  }

  @override
  void dispose() { _ctrl.dispose(); super.dispose(); }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppTheme.background,
      body: SafeArea(
        child: Column(
          children: [
            Align(
              alignment: Alignment.centerRight,
              child: TextButton(
                onPressed: _skip,
                child: const Text('Skip', style: TextStyle(color: AppTheme.textMuted, fontSize: 14)),
              ),
            ),
            Expanded(
              child: PageView.builder(
                controller: _ctrl,
                onPageChanged: (i) => setState(() => _page = i),
                itemCount: _pages.length,
                itemBuilder: (_, i) {
                  final p = _pages[i];
                  return Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 32),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Container(
                          width: 88,
                          height: 88,
                          decoration: BoxDecoration(
                            color: AppTheme.surface,
                            borderRadius: BorderRadius.circular(24),
                            border: Border.all(color: Colors.black12),
                          ),
                          child: Icon(p['icon'] as IconData, color: AppTheme.primary, size: 44),
                        ),
                        const SizedBox(height: 40),
                        Text(p['title'] as String,
                            textAlign: TextAlign.center,
                            style: const TextStyle(fontSize: 26, fontWeight: FontWeight.w700, color: Colors.black, letterSpacing: -0.5)),
                        const SizedBox(height: 14),
                        Text(p['desc'] as String,
                            textAlign: TextAlign.center,
                            style: const TextStyle(fontSize: 15, color: AppTheme.textMuted, height: 1.6)),
                      ],
                    ),
                  );
                },
              ),
            ),
            Padding(
              padding: const EdgeInsets.fromLTRB(24, 0, 24, 32),
              child: Column(
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: List.generate(_pages.length, (i) => AnimatedContainer(
                      duration: const Duration(milliseconds: 250),
                      margin: const EdgeInsets.symmetric(horizontal: 4),
                      width: _page == i ? 24 : 8,
                      height: 8,
                      decoration: BoxDecoration(
                        color: _page == i ? AppTheme.primary : Colors.black12,
                        borderRadius: BorderRadius.circular(4),
                      ),
                    )),
                  ),
                  const SizedBox(height: 28),
                  NeonButton(
                    text: _page == _pages.length - 1 ? 'Get Started' : 'Continue',
                    onPressed: _next,
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
