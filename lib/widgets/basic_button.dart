import 'package:final_proj_flutter/util/appcolors.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class BasicButton extends StatelessWidget {
  final String? label;
  final TextStyle? textStyle;

  const BasicButton({super.key, this.label, this.textStyle});

  @override
  Widget build(BuildContext context) {
    double buttonSize =
        ScreenUtil().orientation == Orientation.portrait ? 70.h : 40.w;

    return Container(
      width: buttonSize,
      height: buttonSize,
      decoration: BoxDecoration(
        color: AppColors.basicButton,
        borderRadius: BorderRadius.circular(12),
        boxShadow: const [
          BoxShadow(
            color: Colors.black26,
            blurRadius: 10,
            offset: Offset(-1, 3),
          ),
        ],
      ),
      child: Center(
        child: Text(
          label ?? 'Button',
          textAlign: TextAlign.center,
          style: textStyle ?? const TextStyle(color: AppColors.darkText),
        ),
      ),
    );
  }
}
