import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:printeasy_utils/printeasy_utils.dart';

class AppLoader extends StatelessWidget {
  const AppLoader({
    super.key,
    this.isDialog = true,
    this.message,
  });

  final bool isDialog;
  final String? message;

  @override
  Widget build(BuildContext context) => Center(
        child: Card(
          elevation: isDialog ? null : 0,
          color: context.theme.cardColor,
          child: Padding(
            padding: isDialog && message != null ? const EdgeInsets.all(16) : const EdgeInsets.all(8),
            child: Row(
              crossAxisAlignment: CrossAxisAlignment.center,
              mainAxisSize: MainAxisSize.min,
              children: [
                CircularProgressIndicator(
                  color: context.theme.primaryColor,
                  strokeWidth: 3,
                ),
                if (isDialog && message != null) ...[
                  const SizedBox(width: 16),
                  Text(
                    message!,
                    style: context.labelLarge,
                  ),
                ],
              ],
            ),
          ),
        ),
      );
}
