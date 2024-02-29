
import 'package:flutter/material.dart';
import 'package:mahmoud_fathi_start_tech_task/core/utils/values_manager.dart';
import 'package:mahmoud_fathi_start_tech_task/view/widgets/shared/gap.dart';

class UserDataElement extends StatelessWidget {
  final IconData icon;
  final String text;
  const UserDataElement({
    super.key, required this.icon, required this.text,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(bottom: AppSize.s15),
      child: Row(
        children: [
          Icon(icon),
          const Gap(20),
          Text(text,style: Theme.of(context).textTheme.bodyLarge,)
        ],
      ),
    );
  }
}