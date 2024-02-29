import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';
import 'package:mahmoud_fathi_start_tech_task/core/helper/validation_helper.dart';
import 'package:mahmoud_fathi_start_tech_task/core/utils/assets_manager.dart';
import 'package:mahmoud_fathi_start_tech_task/core/utils/strings_manager.dart';
import 'package:mahmoud_fathi_start_tech_task/core/utils/values_manager.dart';
import 'package:mahmoud_fathi_start_tech_task/logic/controllers/app_controller.dart';
import 'package:mahmoud_fathi_start_tech_task/models/auth_model.dart';
import 'package:mahmoud_fathi_start_tech_task/view/widgets/shared/default_text_form_field.dart';
import 'package:mahmoud_fathi_start_tech_task/view/widgets/shared/gap.dart';

class UpdateInfoScreen extends StatefulWidget {
  final AuthModel userInfo;

  const UpdateInfoScreen({super.key, required this.userInfo});

  @override
  State<UpdateInfoScreen> createState() => _UpdateInfoScreenState();
}

class _UpdateInfoScreenState extends State<UpdateInfoScreen> {
  final controller = Get.put<AppController>(AppController());

  final formKey = GlobalKey<FormState>();

  final nameController = TextEditingController();

  final phoneController = TextEditingController();

  final emailController = TextEditingController();

  @override
  void initState() {
    nameController.text = widget.userInfo.data!.name!;
    phoneController.text = widget.userInfo.data!.phone!;
    emailController.text = widget.userInfo.data!.email!;
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
          title: const Text(StringsManager.updateInfo),
          leading: IconButton(
              onPressed: () {
                Get.back();
              },
              icon: const Icon(Icons.arrow_back_ios_new))),
      body: Form(
        key: formKey,
        child: ListView(
          padding: const EdgeInsets.symmetric(vertical: 24, horizontal: 50),
          children: [
            DefaultTextFormField(
              controller: nameController,
              hint: StringsManager.fullName,
              keyboardType: TextInputType.name,
              validator: (fullName) =>
                  ValidationHelper.validateFullName(fullName),
            ),
            const Gap(AppSize.s20),
            DefaultTextFormField(
              controller: phoneController,
              prefixIcon: Padding(
                padding: const EdgeInsetsDirectional.only(start: AppSize.s10),
                child: SvgPicture.asset(
                  ImageAssets.uae,
                  height: AppSize.s24,
                ),
              ),
              hint: StringsManager.phoneHint,
              keyboardType: TextInputType.phone,
              inputFormatters: [
                LengthLimitingTextInputFormatter(9),
                FilteringTextInputFormatter.digitsOnly
              ],
              validator: (phone) => ValidationHelper.validatePhone(phone),
            ),
            const Gap(20),
            DefaultTextFormField(
                controller: emailController,
                hint: StringsManager.emailAddress,
                keyboardType: TextInputType.emailAddress,
                validator: (email) => ValidationHelper.validateEmail(email)),
            const Gap(20),
            Obx(() {
              if (controller.isSaveLoading.value) {
                return const Center(child: CircularProgressIndicator());
              } else {
                return ElevatedButton(
                    onPressed: () {
                      if (formKey.currentState!.validate()) {
                        controller.updateInfo(
                            name: nameController.text,
                            email: emailController.text,
                            phone: phoneController.text,
                            countryCode: '+971');
                      }
                    },
                    child: const Text(StringsManager.save));
              }
            })
          ],
        ),
      ),
    );
  }
}
