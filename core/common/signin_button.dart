
//import 'dart:js';

import 'package:bike_comm/core/constants/constants.dart';
import 'package:bike_comm/features/auth/controller/auth_cantroller.dart';
import 'package:bike_comm/theme/pallete.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class SignInButton extends ConsumerWidget {
  const SignInButton({super.key});

  void signInWithGoogle(BuildContext context,WidgetRef ref){
    ref.read(authControllerProvider.notifier).signInWithGoogle(context);
  }

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Padding(
      padding: const EdgeInsets.all(20.0),
      child: ElevatedButton.icon(
        onPressed: ()=> signInWithGoogle(context, ref),
        icon: Image.asset(Constants.googlePath,width:35 ,),
        label: const Text('Continue With Google',style: TextStyle(
          fontSize: 18,
        ),),
        style: ElevatedButton.styleFrom(
          backgroundColor: Pallete.greyColor,
          minimumSize: const Size(double.infinity, 50),
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(20),
          )
        ),
      ),
    );
  }
}