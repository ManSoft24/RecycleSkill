import 'package:flutter/material.dart';
import 'package:recycle_skill/components/custom_app_bar.dart';
import 'package:recycle_skill/components/profile_page/profile_header.dart';

class ProfilePages extends StatelessWidget {
  ProfilePages({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CustomAppBar(),
      body: SingleChildScrollView(
        physics: const BouncingScrollPhysics(),
        padding: const EdgeInsets.fromLTRB(16, 16, 16, 110),
        child: Column(
          children: [
            ProfileHeader(),
          ],
        ),
      ),
    );
  }
}
