import 'package:client/design/app_colors.dart';
import 'package:client/features/chats/chats_page.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

class OnboardingPage extends StatelessWidget {
  const OnboardingPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.greenBgColor,
      body: Padding(
        padding: const EdgeInsets.fromLTRB(8.0, 190, 8.0, 8.0),
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              // ignore: deprecated_member_use
              SizedBox(
                height: 180,
                width: 180,
                child: SvgPicture.asset(
                  "assets/openai.svg",
                  // ignore: deprecated_member_use
                  color: Colors.white,
                ),
              ),
              const SizedBox(
                height: 20,
              ),
              Text(
                "Welcome to ChatGPT",
                style: TextStyle(
                    color: AppColors.pinkBgColor,
                    fontSize: 32,
                    fontWeight: FontWeight.bold),
              ),
              const SizedBox(
                height: 15,
              ),
              Center(
                child: Text(
                  "With ChatGPT, you can type or start a real-time voice conversation by tapping the soundwave icon in the mobile app.",
                  style: TextStyle(
                      color: AppColors.pinkBgColor,
                      fontSize: 25,
                      fontWeight: FontWeight.w300),
                  textAlign: TextAlign.center,
                ),
              ),
              const Spacer(),
              SizedBox(
                height: 45,
                child: ElevatedButton(
                    style: const ButtonStyle(
                      // ignore: deprecated_member_use
                      // backgroundColor: MaterialStateProperty.all(Colors.transparent),
                      backgroundColor: WidgetStateColor.transparent,
                      elevation: WidgetStatePropertyAll(1),
                      shape: WidgetStatePropertyAll(RoundedRectangleBorder()),
                      // side: BorderSide(color: AppColors.pinkBgColor)
                    ),
                    onPressed: () {
                      Navigator.pushReplacement(
                          context,
                          MaterialPageRoute(
                              builder: (context) => const ChatScreenPage()));
                    },
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text(
                          "Try ChatGPT",
                          style: TextStyle(
                              color: AppColors.pinkBgColor,
                              fontSize: 20,
                              fontWeight: FontWeight.w100),
                        ),
                        const SizedBox(
                          height: 15,
                        ),
                        Icon(
                          Icons.arrow_forward,
                          color: AppColors.pinkBgColor,
                        )
                      ],
                    )),
              ),
              const SizedBox(
                height: 20,
              ),
            ],
          ),
        ),
      ),
    );
  }
}
