import 'dart:convert';
import 'dart:ui';

import 'package:file_picker/file_picker.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:get/get.dart';
import 'package:image_picker/image_picker.dart';
import 'package:printeasy_utils/printeasy_utils.dart';
import 'package:screenshot/screenshot.dart';

class Utility {
  const Utility._();

  static void hideKeyboard() => FocusManager.instance.primaryFocus?.unfocus();

  static void updateLater(VoidCallback callback, [bool addDelay = true]) {
    WidgetsBinding.instance.addPostFrameCallback((_) {
      Future.delayed(addDelay ? const Duration(milliseconds: 10) : Duration.zero, () {
        callback();
      });
    });
  }

  static Future<Uint8List?> captureWidget(
    GlobalKey key, {
    BuildContext? context,
  }) async {
    var boundary = key.currentContext?.findRenderObject() as RenderRepaintBoundary?;

    final image = await boundary?.toImage(pixelRatio: View.of((context ?? Get.context)!).devicePixelRatio);
    final byteData = await image?.toByteData(format: ImageByteFormat.png);

    image?.dispose();

    final pngBytes = byteData?.buffer.asUint8List();

    return pngBytes;
  }

  static Future<Uint8List?> captureFromWidget(
    Widget child, {
    BuildContext? context,
  }) =>
      ScreenshotController().captureFromWidget(
        child,
        context: context,
      );

  /// Show loader
  static void showLoader([String? message]) {
    Get.dialog(
      AppLoader(message: message),
      barrierDismissible: false,
    );
  }

  /// Close any open dialog.
  static void closeLoader() {
    if (Get.isDialogOpen ?? false) Get.back(canPop: false);
  }

  static Future<XFile?> pickImage({
    ImageSource? source,
    bool showLoader = false,
  }) async {
    if (showLoader) {
      Utility.showLoader();
    }

    XFile? image;
    try {
      image = await ImagePicker().pickImage(
        source: source ?? ImageSource.gallery,
      );
    } catch (e) {
      if (kDebugMode) {
        print('Error picking image: $e');
      }
      await Utility.showInfoDialog(DialogModel.error(e.toString()));
    } finally {
      if (showLoader) {
        Utility.closeLoader();
      }
    }

    return image;
  }

  static Future<Uint8List?> pickImageBytes({
    ImageSource? source,
    int minSizeInKb = 900,
  }) async {
    var image = await pickImage(
      source: source,
    );
    if (image == null) {
      return null;
    }
    final imageBytes = await image.readAsBytes();

    if (imageBytes.length < minSizeInKb * 1024) {
      await Utility.showInfoDialog(DialogModel.error(
        'The image you uploaded appears to be small. For the best print quality, please use a higher resolution image.',
        'Alert',
      ));
    }
    return imageBytes;
  }

  static Future<String?> pickFileBytes({
    int minSizeInKb = 900,
  }) async {
    final result = await FilePicker.platform.pickFiles(
      type: FileType.image,
      allowMultiple: false,
      allowCompression: false,
    );
    if (result == null) {
      return null;
    }
    if (result.files.isEmpty) {
      return null;
    }
    final file = result.files.first;
    final imageBytes = file.bytes;
    if (imageBytes == null) {
      return null;
    }

    if (imageBytes.length < minSizeInKb * 1024) {
      await Utility.showInfoDialog(DialogModel.error(
        'The image you uploaded appears to be small. For the best print quality, please use a higher resolution image.',
        'Alert',
      ));
    }
    return jsonEncode(imageBytes);
  }

  static Future<void> showInfoDialog(DialogModel dialog) async {
    await Get.dialog(
      DialogWrapper(
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            if (dialog.title != null)
              Text(
                dialog.title!,
                style: Get.context!.textTheme.titleLarge,
              ),
            const SizedBox(height: 16),
            Text(
              dialog.data,
              style: Get.context!.textTheme.bodyLarge,
            ),
            const SizedBox(height: 16),
            AppButton(
              label: 'Okay',
              onTap: Get.back,
            ),
          ],
        ),
      ),
      barrierDismissible: false,
    );
  }

  /// Method For Get Floated Snack Bar
  static void openSnackbar(
    String message, [
    Color backgroundColor = Colors.green,
  ]) async {
    Get.rawSnackbar(
      animationDuration: const Duration(milliseconds: 500),
      message: message,
      mainButton: IconButton(
        onPressed: Get.closeCurrentSnackbar,
        icon: Icon(
          Icons.close_rounded,
          color: AppColors.white,
        ),
      ),
      backgroundColor: backgroundColor,
      margin: const EdgeInsets.all(16.0),
      borderRadius: 16,
      snackStyle: SnackStyle.FLOATING,
      snackPosition: SnackPosition.BOTTOM,
    );
  }
}
