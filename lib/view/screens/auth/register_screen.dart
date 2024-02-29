import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';
import 'package:mahmoud_fathi_start_tech_task/core/helper/validation_helper.dart';
import 'package:mahmoud_fathi_start_tech_task/core/utils/assets_manager.dart';
import 'package:mahmoud_fathi_start_tech_task/core/utils/strings_manager.dart';
import 'package:mahmoud_fathi_start_tech_task/core/utils/values_manager.dart';
import 'package:mahmoud_fathi_start_tech_task/logic/controllers/app_controller.dart';
import 'package:mahmoud_fathi_start_tech_task/view/screens/auth/login_screen.dart';
import 'package:mahmoud_fathi_start_tech_task/view/widgets/shared/app_logo_with_text.dart';
import 'package:mahmoud_fathi_start_tech_task/view/widgets/shared/default_text_form_field.dart';
import 'package:mahmoud_fathi_start_tech_task/view/widgets/shared/gap.dart';
import 'package:mahmoud_fathi_start_tech_task/view/widgets/shared/regular_and_bold_text.dart';

class RegisterScreen extends StatelessWidget {
  RegisterScreen({super.key});

  final controller = Get.put<AppController>(AppController());
  final formKey = GlobalKey<FormState>();
  final nameController = TextEditingController();
  final phoneController = TextEditingController();
  final emailController = TextEditingController();
  final passwordController = TextEditingController();
  final confirmPasswordController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: Form(
          key: formKey,
          child: ListView(
            padding: const EdgeInsets.symmetric(vertical: AppSize.s20, horizontal: AppSize.s50),
            children: [
              const Gap(AppSize.s40),
              const AppLogoWithText(
                text: StringsManager.register,
              ),
              Gap(MediaQuery.of(context).orientation == Orientation.landscape
                  ? AppSize.s30
                  : AppSize.s30),
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
                  LengthLimitingTextInputFormatter(AppInt.i9),
                  FilteringTextInputFormatter.digitsOnly
                ],
                validator: (phone) =>
                    ValidationHelper.validatePhone(phone),
              ),
              const Gap(AppSize.s20),
              DefaultTextFormField(
                  controller: emailController,
                  hint: StringsManager.emailAddress,
                  keyboardType: TextInputType.emailAddress,
                  validator: (email) =>ValidationHelper.validateEmail(email)
              ),
              const Gap(AppSize.s20),
              GetBuilder<AppController>(builder: (_) {
                return DefaultTextFormField(
                  controller: passwordController,
                  hint: StringsManager.password,
                  keyboardType: TextInputType.visiblePassword,
                  obscureText:
                      controller.isRegisterPasswordVisibility ? false : true,
                  suffixIcon: IconButton(
                      onPressed: () {
                        controller.registerPasswordVisibility();
                      },
                      icon: Icon(controller.isRegisterPasswordVisibility
                          ? Icons.visibility_off
                          : Icons.visibility)),
                    validator: (password) =>
                        ValidationHelper.validatePassword(password)
                );
              }),
              const Gap(AppSize.s20),
              GetBuilder<AppController>(builder: (_) {
                return DefaultTextFormField(
                  controller: confirmPasswordController,
                  hint: StringsManager.confirmPassword,
                  keyboardType: TextInputType.visiblePassword,
                  obscureText: controller.isRegisterConfirmPasswordVisibility
                      ? false
                      : true,
                  suffixIcon: IconButton(
                      onPressed: () {
                        controller.registerConfirmPasswordVisibility();
                      },
                      icon: Icon(controller.isRegisterConfirmPasswordVisibility
                          ? Icons.visibility_off
                          : Icons.visibility)),
                    validator: (confirmPassword) =>
                        ValidationHelper.validateConfirmPassword(
                            passwordController.text, confirmPassword!)
                );
              }),
              const Gap(AppSize.s40),
              Obx(
        () {
                    if (controller.isRegisterRequestLoading.value) {
                      return const Center(child: CircularProgressIndicator());
                    } else {
                      return ElevatedButton(
                          onPressed: () {
                            if (formKey.currentState!.validate()) {
                              controller.register(
                                  name: nameController.text,
                                  email: emailController.text,
                                  phone: phoneController.text,
                                  password: passwordController.text,
                                  countryCode: '+971',
                                  confirmPassword: passwordController.text);
                            }
                          },
                          child: const Text(StringsManager.register));
                    }
                  }
              ),
              Gap(MediaQuery.of(context).orientation == Orientation.landscape
                  ? AppSize.s20
                  :(MediaQuery.sizeOf(context).height - AppSize.s800).isNegative?20: MediaQuery.sizeOf(context).height - AppSize.s840),
              RegularAndBoldText(
                regularText: StringsManager.alreadyHaveAnAccount,
                boldText: StringsManager.login,
                onTap: () {
                  Get.to(() => LoginScreen());
                },
              )
            ],
          ),
        ),
      ),
    );
  }
}
