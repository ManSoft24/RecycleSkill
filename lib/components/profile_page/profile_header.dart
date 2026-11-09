import 'package:flutter/material.dart';

class ProfileHeader extends StatelessWidget {
  ProfileHeader({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Container(
          width: double.infinity,
          padding: EdgeInsets.only(top: 20, right: 10, left: 10, bottom: 20),
          child: Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Stack(
                children: [
                  Container(
                    width: 60,
                    height: 60,
                    decoration: BoxDecoration(
                      shape: BoxShape.circle,
                      color: Color.fromARGB(80, 0, 105, 72),
                    ),
                  ),

                  Positioned(
                    top: 3,
                    bottom: 3,
                    left: 3,
                    right: 3,
                    child: Container(
                      width: 65,
                      height: 65,
                      alignment: Alignment.center,
                      child: CircleAvatar(
                        radius: 37.5,
                        backgroundImage: AssetImage('image/pfp.jpg'),
                      ),
                    ),
                  ),

                  Positioned(
                    bottom: 0,
                    right: 0,
                    child: Container(
                      width: 22,
                      height: 22,
                      decoration: BoxDecoration(
                        shape: BoxShape.circle,
                        color: Color.fromARGB(255, 255, 255, 255),
                      ),
                    ),
                  ),

                  Positioned(
                    bottom: 4,
                    right: 4,
                    child: Container(
                      width: 15,
                      height: 15,
                      decoration: BoxDecoration(
                        shape: BoxShape.circle,
                        color: Color.fromARGB(255, 0, 105, 72),
                      ),
                    ),
                  ),

                  Positioned(
                    bottom: 4,
                    right: 4.5,
                    child: Icon(
                      Icons.verified_outlined,
                      size: 14,
                      color: Color.fromARGB(255, 255, 255, 255),
                    ),
                  ),
                ],
              ),

              const SizedBox(width: 16),

              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Wrap(
                      crossAxisAlignment: WrapCrossAlignment.center,
                      spacing: 10,
                      children: [
                        Container(
                          padding: EdgeInsets.only(bottom: 2),
                          child: Text(
                            'Tio Wicaksono',
                            style: TextStyle(
                              fontFamily: 'Jakarta',
                              fontSize: 16,
                              fontWeight: FontWeight.w800,
                              color: Color(0xFF111827),
                            ),
                          ),
                        ),

                        const SizedBox(width: 2),

                        Container(
                          padding: const EdgeInsets.symmetric(
                            horizontal: 4,
                            vertical: 2,
                          ),
                          decoration: BoxDecoration(
                            color: const Color.fromARGB(255, 133, 248, 196),
                            borderRadius: BorderRadius.circular(16),
                          ),
                          child: Row(
                            mainAxisSize: MainAxisSize.min,
                            children: const [
                              Icon(
                                Icons.verified_outlined,
                                size: 14,
                                color: Color(0xFF047857),
                              ),
                              SizedBox(width: 4),
                              Text(
                                'Terverifikasi',
                                style: TextStyle(
                                  fontFamily: 'Jakarta',
                                  fontSize: 12,
                                  fontWeight: FontWeight.w600,
                                  color: Color(0xFF047857),
                                ),
                              ),
                            ],
                          ),
                        ),
                      ],
                    ),

                    Text(
                      'Warga RT 03 / RW 02 Gondosari, Gebog, Kudus',
                      style: TextStyle(
                        fontFamily: 'Jakarta',
                        fontSize: 13,
                        fontWeight: FontWeight.w500,
                        color: Color(0xFF111827),
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ],
    );
  }
}
