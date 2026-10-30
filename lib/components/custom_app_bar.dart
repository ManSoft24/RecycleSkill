import 'package:flutter/material.dart';

class CustomAppBar extends StatelessWidget implements PreferredSizeWidget {
  final VoidCallback? onNotificationTap;
  final VoidCallback? onMessageTap;

  const CustomAppBar({
    super.key,
    this.onNotificationTap,
    this.onMessageTap,
  });

  static const double _toolbarHeight = 62.0;

  @override
  Size get preferredSize => const Size.fromHeight(_toolbarHeight);

  @override
  Widget build(BuildContext context) {
   
    final double statusBarHeight = MediaQuery.of(context).padding.top;

    return Container(
      height: _toolbarHeight + statusBarHeight,
      decoration: BoxDecoration(
        color: const Color(0xFF265D46),
        image: const DecorationImage(
          image: AssetImage('image/batik_appbar_bg.jpg'),
          fit: BoxFit.cover,
        ),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withValues(alpha: 0.12),
            blurRadius: 8,
            offset: const Offset(0, 3),
          ),
        ],
      ),
      child: SafeArea(
        bottom: false,
        child: SizedBox(
          height: _toolbarHeight,
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 20),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Container(
                  width: 42,
                  height: 42,
                  decoration: const BoxDecoration(
                    shape: BoxShape.circle,
                    color: Colors.white,
                    boxShadow: [
                      BoxShadow(
                        color: Colors.black12,
                        blurRadius: 4,
                        offset: Offset(0, 2),
                      ),
                    ],
                  ),
                  child: Padding(
                    padding: const EdgeInsets.all(5.0),
                    child: Image.asset(
                      'image/recycleskill_emblem.png',
                      fit: BoxFit.contain,
                    ),
                  ),
                ),

                Row(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    GestureDetector(
                      onTap: onNotificationTap,
                      behavior: HitTestBehavior.opaque,
                      child: const SizedBox(
                        width: 36,
                        height: 36,
                        child: Center(
                          child: Icon(
                            Icons.notifications_none_rounded,
                            color: Colors.white,
                            size: 26,
                          ),
                        ),
                      ),
                    ),

                    const SizedBox(width: 12),

                    GestureDetector(
                      onTap: onMessageTap,
                      behavior: HitTestBehavior.opaque,
                      child: const SizedBox(
                        width: 36,
                        height: 36,
                        child: Center(
                          child: Icon(
                            Icons.chat_bubble_outline_rounded,
                            color: Colors.white,
                            size: 24,
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
