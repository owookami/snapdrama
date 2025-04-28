import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';
import 'package:mobile/router/routes.dart';
import 'package:mobile/shared/widgets/sd_button.dart';
import 'package:mobile/shared/widgets/sd_episode_card.dart';
import 'package:mobile/shared/widgets/sd_footer.dart';

class HomeScreen extends ConsumerWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final theme = Theme.of(context);

    return Scaffold(
      appBar: AppBar(
        title: const Text('SnapDrama'),
        actions: [
          IconButton(
            icon: const Icon(Icons.search),
            onPressed: () => context.goNamed(AppRoutes.search),
          ),
          IconButton(
            icon: const Icon(Icons.person),
            onPressed: () => context.goNamed(AppRoutes.profile),
          ),
        ],
      ),
      body: RefreshIndicator(
        onRefresh: () async {
          // 데이터 새로고침 로직 (나중에 추가)
          await Future.delayed(const Duration(seconds: 1));
        },
        child: CustomScrollView(
          slivers: [
            // 헤더 배너
            SliverToBoxAdapter(
              child: _buildHeaderBanner(context),
            ),

            // 인기 드라마 섹션
            SliverToBoxAdapter(
              child: Padding(
                padding: const EdgeInsets.fromLTRB(16, 24, 16, 8),
                child: Row(
                  children: [
                    Text(
                      '인기 드라마',
                      style: theme.textTheme.titleLarge,
                    ),
                    const Spacer(),
                    TextButton(
                      onPressed: () {
                        // 전체보기 액션
                      },
                      child: const Text('더보기'),
                    ),
                  ],
                ),
              ),
            ),

            // 인기 드라마 목록
            SliverToBoxAdapter(
              child: SizedBox(
                height: 180,
                child: ListView.builder(
                  scrollDirection: Axis.horizontal,
                  padding: const EdgeInsets.symmetric(horizontal: 12),
                  itemCount: 5, // 임시 데이터 개수
                  itemBuilder: (context, index) {
                    return _buildPopularDramaItem(context, index);
                  },
                ),
              ),
            ),

            // 최신 에피소드 섹션
            SliverToBoxAdapter(
              child: Padding(
                padding: const EdgeInsets.fromLTRB(16, 24, 16, 8),
                child: Row(
                  children: [
                    Text(
                      '최신 에피소드',
                      style: theme.textTheme.titleLarge,
                    ),
                    const Spacer(),
                    TextButton(
                      onPressed: () {
                        // 전체보기 액션
                      },
                      child: const Text('더보기'),
                    ),
                  ],
                ),
              ),
            ),

            // 최신 에피소드 목록
            SliverList(
              delegate: SliverChildBuilderDelegate(
                (context, index) {
                  return Padding(
                    padding:
                        const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
                    child: SdEpisodeCard(
                      thumbnailUrl:
                          'https://via.placeholder.com/300x169?text=Episode+${index + 1}',
                      title: '모래달 ${index + 1}화',
                      subtitle: 'S1 E${index + 1} · 2023-10-${10 + index}',
                      isPremium: index % 3 == 0,
                      progress: index % 4 == 0 ? 0.7 : null,
                      onTap: () {
                        context.goNamed(
                          AppRoutes.episodeDetail,
                          pathParameters: {'episodeId': '${index + 1}'},
                        );
                      },
                    ),
                  );
                },
                childCount: 10, // 임시 데이터 개수
              ),
            ),

            // 푸터
            SliverToBoxAdapter(
              child: Padding(
                padding: const EdgeInsets.only(top: 16),
                child: SdFooter(
                  actions: [
                    TextButton(
                      onPressed: () {},
                      child: const Text('이용약관'),
                    ),
                    TextButton(
                      onPressed: () {},
                      child: const Text('개인정보처리방침'),
                    ),
                  ],
                ),
              ),
            ),

            // 하단 여백
            const SliverToBoxAdapter(
              child: SizedBox(height: 16),
            ),
          ],
        ),
      ),
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: 0,
        onTap: (index) {
          switch (index) {
            case 0:
              // 홈 (현재 페이지)
              break;
            case 1:
              // 라이브러리
              context.goNamed(AppRoutes.library);
              break;
            case 2:
              // 프로필
              context.goNamed(AppRoutes.profile);
              break;
          }
        },
        items: const [
          BottomNavigationBarItem(
            icon: Icon(Icons.home),
            label: '홈',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.video_library),
            label: '라이브러리',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.person),
            label: '프로필',
          ),
        ],
      ),
    );
  }

  // 헤더 배너 위젯
  Widget _buildHeaderBanner(BuildContext context) {
    return Container(
      margin: const EdgeInsets.all(16),
      height: 200,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(16),
        color: Theme.of(context).colorScheme.primary,
        image: const DecorationImage(
          image: NetworkImage(
              'https://via.placeholder.com/800x400?text=Featured+Drama'),
          fit: BoxFit.cover,
        ),
      ),
      child: Stack(
        children: [
          // 그라데이션 오버레이
          Container(
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(16),
              gradient: LinearGradient(
                begin: Alignment.topCenter,
                end: Alignment.bottomCenter,
                colors: [
                  Colors.transparent,
                  Colors.black.withOpacity(0.7),
                ],
              ),
            ),
          ),

          // 콘텐츠
          Padding(
            padding: const EdgeInsets.all(16),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
                Text(
                  '모래달',
                  style: Theme.of(context).textTheme.headlineMedium?.copyWith(
                        color: Colors.white,
                        fontWeight: FontWeight.bold,
                      ),
                ),
                const SizedBox(height: 8),
                Text(
                  '죽은 자들의 영혼을 인도하는 저승사자 이동탁이 인간 세계에서 펼치는 판타지 드라마',
                  style: Theme.of(context).textTheme.bodyMedium?.copyWith(
                        color: Colors.white,
                      ),
                  maxLines: 2,
                  overflow: TextOverflow.ellipsis,
                ),
                const SizedBox(height: 16),
                SdButton(
                  label: '시청하기',
                  onPressed: () {},
                  icon: Icons.play_circle_outline,
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }

  // 인기 드라마 아이템 위젯
  Widget _buildPopularDramaItem(BuildContext context, int index) {
    return GestureDetector(
      onTap: () {
        context.goNamed(
          AppRoutes.dramaDetail,
          pathParameters: {'dramaId': '${index + 1}'},
        );
      },
      child: Container(
        width: 120,
        margin: const EdgeInsets.symmetric(horizontal: 4),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // 이미지
            ClipRRect(
              borderRadius: BorderRadius.circular(8),
              child: Image.network(
                'https://via.placeholder.com/120x160?text=Drama+${index + 1}',
                height: 160,
                width: 120,
                fit: BoxFit.cover,
              ),
            ),
            const SizedBox(height: 4),
            // 제목
            Text(
              '드라마 ${index + 1}',
              style: Theme.of(context).textTheme.bodyMedium,
              maxLines: 1,
              overflow: TextOverflow.ellipsis,
            ),
          ],
        ),
      ),
    );
  }
}
