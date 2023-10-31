import 'package:edit_profile_screen/presentation/ui/screens/edit_profile_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class EditProfile extends StatelessWidget {
  const EditProfile({super.key});
  @override
  Widget build(BuildContext context) {


    return ScreenUtilInit(
      designSize: const Size(430, 932),
      minTextAdapt: true,
      splitScreenMode: true,
      builder: (context, child) {
        return MaterialApp(
            debugShowCheckedModeBanner: false,
            title: 'EditProfile',
            theme: ThemeData(
              highlightColor: Colors.transparent,
              splashColor: Colors.transparent,
              fontFamily: "Poppins",
            ),
            home:   EditProfileScreen(),
        );
      },
    );
  }
}