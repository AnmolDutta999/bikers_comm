import 'package:bike_comm/features/auth/community/screens/add_mod_screen.dart';
import 'package:bike_comm/features/auth/community/screens/community_screen.dart';
import 'package:bike_comm/features/auth/community/screens/create_community_screen.dart';
import 'package:bike_comm/features/auth/community/screens/edit_community_screen.dart';
import 'package:bike_comm/features/auth/community/screens/mod_tool_screen.dart';
import 'package:bike_comm/features/auth/home/screens/home_screen.dart';
import 'package:bike_comm/features/auth/screens/login_screen.dart';
import 'package:bike_comm/features/post/screens/add_post_screen_type.dart';
import 'package:bike_comm/features/user_profile/screens/edit_profile_screen.dart';
import 'package:flutter/material.dart';
import 'package:routemaster/routemaster.dart';

import 'features/user_profile/screens/user_profile_screen.dart';

final loggedOutRoute = RouteMap(routes: {
  '/': (_) => const MaterialPage(child: LoginScreen())
});

final loggedInRoute = RouteMap(routes: {
  '/': (_) => const MaterialPage(child: HomeScreen()),
  '/create-community': (_) => const MaterialPage(child: CreateCommunityScreen()),
  '/r/:name': (route) =>  MaterialPage(child: CommunityScreen(
    name: route.pathParameters['name']!,
  ),
  ),
  '/mod-tools/:name': (routeData) => MaterialPage(child: ModToolsScreen(
    name: routeData.pathParameters['name']!,
  ),
  ),
  '/edit-community/:name': (routeData) => MaterialPage(child: EditCommunityScreen(
    name: routeData.pathParameters['name']!,
  ),
  ),
   '/add-mods/:name': (routeData) => MaterialPage(child: AddModScreen(
    name: routeData.pathParameters['name']!,
  ),
  ),
  '/u/:uid': (routeData) => MaterialPage(
          child: UserProfileScreen(
            uid: routeData.pathParameters['uid']!,
          ),
        ),
   '/edit-profile/:uid': (routeData) => MaterialPage(
          child: EditProfileScreen(
            uid: routeData.pathParameters['uid']!,
          ),
        ), 
        '/add-post/:type': (routeData) => MaterialPage(
          child: AddPostTypeScreen(
            type: routeData.pathParameters['type']!,
          ),
        ),       

});