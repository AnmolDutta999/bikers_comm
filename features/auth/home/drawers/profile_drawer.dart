import 'package:bike_comm/features/auth/controller/auth_cantroller.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:routemaster/routemaster.dart';

import '../../../../theme/pallete.dart';


class ProfileDrawer extends ConsumerWidget {
  const ProfileDrawer ({super.key});

  void logOut(WidgetRef ref){
    ref.read(authControllerProvider.notifier).logout();
  }
  
  void navigateTOUserProfile(BuildContext context, String uid){
    Routemaster.of(context).push('/u/$uid');
  }

  void toggleTheme(WidgetRef ref) {
    ref.read(themeNotifierProvider.notifier).toggleTheme();
  }

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final user = ref.watch(userProvider)!;
    return Drawer(
      child: SafeArea(
        child: Column(
          children: [
            const SizedBox(height: 5,),
            CircleAvatar(
              backgroundImage: NetworkImage(user.profilePic),
              radius: 65,
            ),
            const SizedBox(height: 10,),
            Text('u/${user.name}', style: const TextStyle(
              fontSize: 18,
              fontWeight: FontWeight.w500,
            ),),
            const SizedBox(height: 10,),
            const Divider(),
             ListTile(
              title: const Text('My Profile'),
              leading: const Icon(Icons.person),
              onTap: () => navigateTOUserProfile(context, user.uid),
            ),
             ListTile(
              title: const Text('Log Out'),
              leading: Icon(Icons.logout, color: Pallete.redColor,),
              onTap: () => logOut(ref),
            ),
            Switch.adaptive(
              value: ref.watch(themeNotifierProvider.notifier).mode == ThemeMode.dark, 
            onChanged: (val)=> toggleTheme(ref)),
          ],
        ),
        ),
    );
  }
}