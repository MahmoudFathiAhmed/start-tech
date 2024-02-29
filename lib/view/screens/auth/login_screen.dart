import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:mahmoud_fathi_start_tech_task/core/helper/validation_helper.dart';
import 'package:mahmoud_fathi_start_tech_task/core/utils/strings_manager.dart';
import 'package:mahmoud_fathi_start_tech_task/core/utils/values_manager.dart';
import 'package:mahmoud_fathi_start_tech_task/logic/controllers/app_controller.dart';
import 'package:mahmoud_fathi_start_tech_task/view/screens/auth/register_screen.dart';
import 'package:mahmoud_fathi_start_tech_task/view/widgets/shared/app_logo_with_text.dart';
import 'package:mahmoud_fathi_start_tech_task/view/widgets/shared/default_text_form_field.dart';
import 'package:mahmoud_fathi_start_tech_task/view/widgets/shared/gap.dart';
import 'package:mahmoud_fathi_start_tech_task/view/widgets/shared/regular_and_bold_text.dart';

class LoginScreen extends StatelessWidget {
  LoginScreen({super.key});

  final controller = Get.put<AppController>(AppController());
  final formKey = GlobalKey<FormState>();
  final emailController = TextEditingController();
  final passwordController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: Form(
          key: formKey,
          child: ListView(
            padding: const EdgeInsets.symmetric(vertical: AppSize.s20, horizontal: AppSize.s50),
            children: [
              const Gap(AppSize.s70),
              const AppLogoWithText(
                text: StringsManager.login,
              ),
              Gap(MediaQuery.of(context).orientation == Orientation.landscape
                  ? AppSize.s30
                  : AppSize.s150),
              DefaultTextFormField(
                  controller: emailController,
                  hint: StringsManager.emailAddress,
                  keyboardType: TextInputType.emailAddress,
                  validator: (email) =>ValidationHelper.validateEmail(email)),
              const Gap(AppSize.s20),
              GetBuilder<AppController>(
                builder: (_) {
                  return DefaultTextFormField(
                    controller: passwordController,
                    hint: StringsManager.password,
                    obscureText:
                        controller.isLoginPasswordVisibility ? false : true,
                    keyboardType: TextInputType.visiblePassword,
                    suffixIcon: IconButton(
                        onPressed: () {
                          controller.loginPasswordVisibility();
                        },
                        icon: Icon(controller.isLoginPasswordVisibility
                            ? Icons.visibility_off
                            : Icons.visibility)),
                      validator: (password) =>
                          ValidationHelper.validatePassword(password)
                  );
                },
              ),
              const Gap(AppSize.s40),
              Obx(
                  (){
                    if(controller.isLoginRequestLoading.value){
                      return const Center(child: CircularProgressIndicator());
                    }else{

                    return ElevatedButton(
                        onPressed: () {
                          if (formKey.currentState!.validate()) {
                            controller.login(
                                email: emailController.text,
                                password: passwordController.text);
                          }
                        },
                        child: const Text(StringsManager.login));
                    }
                  }

              ),
              Gap(MediaQuery.of(context).orientation == Orientation.landscape
                  ? AppSize.s20
                  : (MediaQuery.sizeOf(context).height - AppSize.s800).isNegative?20:MediaQuery.sizeOf(context).height - AppSize.s800),
              RegularAndBoldText(
                regularText: StringsManager.doNotHaveAnAccount,
                boldText: StringsManager.register,
                onTap: () {
                  Get.to(() => RegisterScreen());
                },
              )
            ],
          ),
        ),
      ),
    );
  }
}
