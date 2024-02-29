
import 'package:flutter/material.dart';
import 'package:mahmoud_fathi_start_tech_task/core/utils/assets_manager.dart';
import 'package:mahmoud_fathi_start_tech_task/core/utils/values_manager.dart';
import 'package:mahmoud_fathi_start_tech_task/view/widgets/shared/gap.dart';

class AppLogoWithText extends StatelessWidget {
  final String text;
  const AppLogoWithText({
    super.key, required this.text,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Image.asset(ImageAssets.logo, height: AppSize.s150),
        const Gap(AppSize.s20),
        Text(
          text,
          textAlign: TextAlign.center,
          style: Theme.of(context).textTheme.displayLarge,
        ),
      ],
    );
  }
}