import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:mahmoud_fathi_start_tech_task/core/utils/strings_manager.dart';
import 'package:mahmoud_fathi_start_tech_task/core/utils/values_manager.dart';
import 'package:mahmoud_fathi_start_tech_task/view/screens/auth/login_screen.dart';
import 'package:mahmoud_fathi_start_tech_task/view/screens/auth/register_screen.dart';
import 'package:mahmoud_fathi_start_tech_task/view/widgets/shared/app_logo_with_text.dart';
import 'package:mahmoud_fathi_start_tech_task/view/widgets/shared/gap.dart';
import 'package:mahmoud_fathi_start_tech_task/view/widgets/shared/regular_and_bold_text.dart';

class WelcomeScreen extends StatelessWidget {
  const WelcomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: ListView(
            padding: const EdgeInsets.symmetric(vertical: AppSize.s20, horizontal: AppSize.s50),
            children: [
              const Gap(AppSize.s70),
              const AppLogoWithText(
                text: StringsManager.welcomeToApp,
              ),
              Gap(MediaQuery.of(context).orientation == Orientation.landscape
                  ? AppSize.s30
                  : AppSize.s150),
              ElevatedButton(
                  onPressed: () {
                    Get.to(() => LoginScreen());
                  },
                  child: const Text(StringsManager.login)),
              const Gap(AppSize.s20),
              OutlinedButton(
                  onPressed: () {
                    Get.to(() => RegisterScreen());
                  },
                  child: const Text(StringsManager.register)),
              Gap(MediaQuery.of(context).orientation == Orientation.landscape
                  ? AppSize.s20
                  : (MediaQuery.sizeOf(context).height - AppSize.s700).isNegative?20:MediaQuery.sizeOf(context).height - AppSize.s700),
              const RegularAndBoldText(
                regularText: StringsManager.designedBy,
                boldText: StringsManager.mahmoud,
              )
            ]),
      ),
    );
  }
}
