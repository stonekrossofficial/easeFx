import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import '../../../../core/widgets/feature_card.dart';
import '../../../../core/widgets/app_bottom_nav.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFFFFECA3),
      body: SafeArea(
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 24.0, vertical: 20.0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      "EaseFX",
                      style: Theme.of(context).textTheme.headlineLarge,
                    ),
                    const SizedBox(height: 8),
                    const Text(
                      "Create stunning AI edits instantly",
                      style: TextStyle(
                        color: Colors.black54,
                        fontSize: 16,
                      ),
                    ),
                  ],
                ),
              ),
              
              // TRENDING SECTION
              const Padding(
                padding: EdgeInsets.symmetric(horizontal: 24.0, vertical: 8.0),
                child: Text(
                  "Trending",
                  style: TextStyle(
                    fontSize: 20,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
              
              // TOP PAGEVIEW: Cloth Change & AI Filters
              SizedBox(
                height: 250,
                child: PageView(
                  controller: PageController(viewportFraction: 0.9),
                  children: [
                    _buildBannerCard(
                      context: context,
                      assetPath: "asset/clothchnage.png",
                      title: "Cloth Changer",
                      onTap: () => context.push('/editor'),
                    ),
                    _buildBannerCard(
                      context: context,
                      assetPath: "asset/aifilter.png",
                      title: "AI Filters",
                      onTap: () => context.push('/ai-filters'),
                    ),
                  ],
                ),
              ),
              
              const SizedBox(height: 24),
              
              // RETOUCH SECTION HEADER
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 24.0),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    const Text(
                      "Retouch",
                      style: TextStyle(
                        fontSize: 20,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    Icon(Icons.arrow_forward_ios, size: 16, color: Colors.grey[600]),
                  ],
                ),
              ),
              
              const SizedBox(height: 16),
              
              // HORIZONTAL LIST FOR HEADSHOT (AND FUTURE ITEMS)
              SizedBox(
                height: 180,
                child: ListView(
                  scrollDirection: Axis.horizontal,
                  padding: const EdgeInsets.symmetric(horizontal: 24.0),
                  children: [
                    _buildHorizontalCard(
                      context: context,
                      assetPath: "asset/final_headshot.png",
                      title: "Headshot",
                      width: 140,
                      onTap: () => context.push('/headshot'),
                    ),
                    const SizedBox(width: 16),
                    // Placeholder for future retouch items
                    _buildHorizontalCard(
                      context: context,
                      assetPath: "asset/aifilter.png", // Just a placeholder
                      title: "Coming Soon",
                      width: 140,
                      onTap: () {},
                    ),
                  ],
                ),
              ),
              
              const SizedBox(height: 24),
              
              // HAIRSWAP SECTION
              const Padding(
                padding: EdgeInsets.symmetric(horizontal: 24.0),
                child: Text(
                  "Hair Studio",
                  style: TextStyle(
                    fontSize: 20,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
              const SizedBox(height: 16),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 24.0),
                child: _buildBannerCard(
                  context: context,
                  assetPath: "asset/hairswap.png",
                  title: "Hair Swap",
                  height: 200,
                  fullWidth: true,
                  onTap: () => context.push('/hair-swap'),
                ),
              ),
              
              const SizedBox(height: 24),
              
              // TEXT TO IMAGE SECTION
              const Padding(
                padding: EdgeInsets.symmetric(horizontal: 24.0),
                child: Text(
                  "AI Generator",
                  style: TextStyle(
                    fontSize: 20,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
              const SizedBox(height: 16),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 24.0),
                child: _buildBannerCard(
                  context: context,
                  assetPath: "asset/texttoimage.png",
                  title: "Text to Image",
                  height: 200,
                  fullWidth: true,
                  onTap: () => context.push('/text-to-image'),
                ),
              ),
              const SizedBox(height: 24),
              
              // KONTEXT FLUX SECTION
              const Padding(
                padding: EdgeInsets.symmetric(horizontal: 24.0),
                child: Text(
                  "Advanced Edits",
                  style: TextStyle(
                    fontSize: 20,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
              const SizedBox(height: 16),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 24.0),
                child: _buildBannerCard(
                  context: context,
                  assetPath: "asset/kontextflux.png",
                  title: "Kontext Flux",
                  height: 200,
                  fullWidth: true,
                  onTap: () => context.push('/kontext-flux'),
                ),
              ),
              
              const SizedBox(height: 40),
            ],
          ),
        ),
      ),
      bottomNavigationBar: AppBottomNav(
        currentIndex: 0,
        onTap: (index) {
          if (index == 1) {
            context.go('/creations');
          }
        },
      ),
    );
  }

  Widget _buildBannerCard({
    required BuildContext context,
    required String assetPath,
    required String title,
    double? height,
    bool fullWidth = false,
    required VoidCallback onTap,
  }) {
    return GestureDetector(
      onTap: onTap,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Expanded(
            flex: height == null ? 1 : 0,
            child: Container(
              height: height,
              margin: EdgeInsets.only(right: fullWidth ? 0 : 16),
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(24),
                boxShadow: [
                  BoxShadow(
                    color: Colors.black.withOpacity(0.05),
                    blurRadius: 10,
                    offset: const Offset(0, 4),
                  ),
                ],
                image: DecorationImage(
                  image: AssetImage(assetPath),
                  fit: BoxFit.cover, // Use cover to fill banner area
                ),
              ),
            ),
          ),
          const SizedBox(height: 8),
          Padding(
            padding: EdgeInsets.only(right: fullWidth ? 0 : 16),
            child: Text(
              title,
              style: const TextStyle(
                fontSize: 14,
                fontWeight: FontWeight.w600,
                color: Colors.black87,
              ),
              textAlign: TextAlign.center,
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildHorizontalCard({
    required BuildContext context,
    required String assetPath,
    required String title,
    required double width,
    required VoidCallback onTap,
  }) {
    return GestureDetector(
      onTap: onTap,
      child: SizedBox(
        width: width,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Expanded(
              child: Container(
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(20),
                  boxShadow: [
                    BoxShadow(
                      color: Colors.black.withOpacity(0.1),
                      blurRadius: 10,
                      offset: const Offset(0, 4),
                    ),
                  ],
                  image: DecorationImage(
                    image: AssetImage(assetPath),
                    fit: BoxFit.cover,
                  ),
                ),
              ),
            ),
            const SizedBox(height: 8),
            Text(
              title,
              style: const TextStyle(
                fontSize: 14,
                fontWeight: FontWeight.w600,
                color: Colors.black87,
              ),
              textAlign: TextAlign.center,
              maxLines: 1,
              overflow: TextOverflow.ellipsis,
            ),
          ],
        ),
      ),
    );
  }
}
