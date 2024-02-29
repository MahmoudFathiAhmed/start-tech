
import 'package:flutter/material.dart';
import 'package:mahmoud_fathi_start_tech_task/core/utils/colors_manager.dart';
import 'package:mahmoud_fathi_start_tech_task/core/utils/values_manager.dart';

class HomeActionButton extends StatelessWidget {
  final VoidCallback onTap;
  final String text;
  const HomeActionButton({
    super.key, required this.onTap, required this.text,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(bottom: AppSize.s12),
      child: InkWell(
        onTap: onTap,
        borderRadius: BorderRadius.circular(AppSize.s8),
        child: Container(
          padding: const EdgeInsets.all(AppSize.s12),
          decoration: BoxDecoration(
              color: ColorsManager.white,
              borderRadius: BorderRadius.circular(AppSize.s8),
              boxShadow: [
                BoxShadow(
                    color: Colors.grey.shade300,
                    blurRadius: AppSize.s1,
                    offset: const Offset(AppSize.s0,AppSize.s2)
                )
              ]
          ),
          child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(text,style: Theme.of(context).textTheme.displayLarge!.copyWith(fontSize: AppSize.s20)),
                const Icon(Icons.arrow_forward_ios_sharp)
              ]
          ),
        ),
      ),
    );
  }
}