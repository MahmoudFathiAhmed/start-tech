
import 'package:flutter/material.dart';
import 'package:mahmoud_fathi_start_tech_task/core/utils/values_manager.dart';

class RegularAndBoldText extends StatelessWidget {
  final String regularText;
  final String boldText;
  final VoidCallback? onTap;
  const RegularAndBoldText({
    super.key, required this.regularText, required this.boldText, this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return Center(
      child: InkWell(
        onTap: onTap,
        child: RichText(
            text: TextSpan(
              text: regularText,
              style: Theme.of(context).textTheme.titleSmall,
              children: [
                TextSpan(
                  text: boldText,
                  style: Theme.of(context)
                      .textTheme
                      .displayLarge!
                      .copyWith(fontSize: AppSize.s15),
                )
              ],
            )),
      ),
    );
  }
}