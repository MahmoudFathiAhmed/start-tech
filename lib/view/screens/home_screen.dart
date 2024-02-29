import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:mahmoud_fathi_start_tech_task/core/utils/strings_manager.dart';
import 'package:mahmoud_fathi_start_tech_task/core/utils/values_manager.dart';
import 'package:mahmoud_fathi_start_tech_task/logic/controllers/app_controller.dart';
import 'package:mahmoud_fathi_start_tech_task/models/auth_model.dart';
import 'package:mahmoud_fathi_start_tech_task/view/screens/update_info_screen.dart';
import 'package:mahmoud_fathi_start_tech_task/view/widgets/home/home_action_button.dart';
import 'package:mahmoud_fathi_start_tech_task/view/widgets/home/user_data_element.dart';
import 'package:mahmoud_fathi_start_tech_task/view/widgets/shared/gap.dart';

class HomeScreen extends StatelessWidget {
  final AuthModel userInfo;

  HomeScreen({super.key, required this.userInfo});

  final controller = Get.put<AppController>(AppController());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: const Text(StringsManager.homePage),
        ),
        body: ListView(
          padding: const EdgeInsets.symmetric(
              horizontal: AppSize.s16, vertical: AppSize.s24),
          children: [
            UserDataElement(
              icon: Icons.person_outlined,
              text: userInfo.data!.name ?? '',
            ),
            UserDataElement(
                icon: Icons.phone_android,
                text: '+971 ${userInfo.data!.phone ?? ''}'),
            UserDataElement(
                icon: Icons.mail_outline, text: userInfo.data!.email ?? ''),
            const Gap(AppSize.s20),
            HomeActionButton(
              text: StringsManager.updateInfo,
              onTap: () {
                Get.to(() => UpdateInfoScreen(
                      userInfo: userInfo,
                    ));
              },
            ),
            HomeActionButton(
              text: StringsManager.changePassword,
              onTap: () {},
            ),
            Obx(() {
              if (controller.isDeleteLoading.value) {
                return const Center(child: CircularProgressIndicator());
              } else {
                return HomeActionButton(
                  text: StringsManager.deleteAccount,
                  onTap: () {
                    controller.deleteUser();
                  },
                );
              }
            }),
            HomeActionButton(
              text: StringsManager.logout,
              onTap: () {
                showAdaptiveDialog(
                    context: context,
                    builder: (context) => AlertDialog.adaptive(
                          title: const Text(StringsManager.logoutTitle),
                          content: const Text(StringsManager.logoutMessage),
                          contentTextStyle:
                              Theme.of(context).textTheme.bodySmall,
                          actions: [
                            TextButton(
                                onPressed: () {
                                  controller.logout();
                                },
                                child: const Text(StringsManager.yes)),
                            TextButton(
                                onPressed: () {
                                  Get.back();
                                },
                                child: const Text(StringsManager.cancel)),
                          ],
                        ),
                    barrierDismissible: true);
              },
            ),
          ],
        ));
  }
}
