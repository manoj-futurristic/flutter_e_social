import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import '../feed_module/feed_page.dart';
import '../screens/chat/chat_list_screen.dart';
import '../screens/finder/user_finder.dart';
import '../screens/finder/user_profile.dart';
import '../screens/home_screen.dart';
import '../screens/search_filter/search.dart';
import '../screens/splash_screen.dart';

abstract class RoutesName {
  static const String initialRoute = '/';
  static const String userFinder = 'userfinder';
  static const String feed = 'feed';
  static const String userProfile = 'userprofile';
  static const String search = 'search';
  static const String chat = 'chat';
  static const String postFeed = 'postfeed';
}

class Routes {
  final GoRouter _router = GoRouter(
    initialLocation: RoutesName.initialRoute,
    routes: <RouteBase>[
      GoRoute(
        path: RoutesName.initialRoute,
        builder: (BuildContext context, GoRouterState state) {
          return const SplashScreen();
        },
        routes: <RouteBase>[
          GoRoute(
            path: RoutesName.postFeed,
            builder: (BuildContext context, GoRouterState state) {
              return const HomeScreen();
            },
          ),
          GoRoute(
            path: RoutesName.userFinder,
            builder: (BuildContext context, GoRouterState state) {
              return const UserFinderScreen();
            },
          ),
          GoRoute(
            path: RoutesName.userProfile,
            builder: (BuildContext context, GoRouterState state) {
              return const UserProfileScreen();
            },
          ),
          GoRoute(
            path: RoutesName.search,
            builder: (BuildContext context, GoRouterState state) {
              return const SearchScreen();
            },
          ),
          GoRoute(
            path: RoutesName.chat,
            builder: (BuildContext context, GoRouterState state) {
              return const ChatListScreen();
            },
          ),
          GoRoute(
            path: RoutesName.feed,
            builder: (BuildContext context, GoRouterState state) {
              return FeedPage();
            },
          ),
        ],
      ),
    ],
  );

  GoRouter get router => _router;
}
