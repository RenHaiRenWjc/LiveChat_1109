// ignore_for_file: must_be_immutable

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:com.jc.livechat/tim_ui_kit/base_widgets/tim_ui_kit_base.dart';
import 'package:com.jc.livechat/tim_ui_kit/base_widgets/tim_ui_kit_statelesswidget.dart';

class TIMUIKitFileIcon extends TIMUIKitStatelessWidget {
  final String? fileFormat;
  final double? size;

  TIMUIKitFileIcon( {this.size, this.fileFormat, Key? key}) : super(key: key);

  Map fileMap = {
    "doc": "images/tim_kit/word.png",
    "docx": "images/tim_kit/word.png",
    "ppt": "images/tim_kit/ppt.png",
    "pptx": "images/tim_kit/ppt.png",
    "xls": "images/tim_kit/excel.png",
    "xlsx": "images/tim_kit/excel.png",
    "pdf": "images/tim_kit/pdf.png",
    "zip": "images/tim_kit/zip.png",
    "rar": "images/tim_kit/zip.png",
    "7z": "images/tim_kit/zip.png",
    "tar": "images/tim_kit/zip.png",
    "gz": "images/tim_kit/zip.png",
    "xz": "images/tim_kit/zip.png",
    "bz2": "images/tim_kit/zip.png",
    "txt": "images/tim_kit/txt.png",
    "jpg": "images/tim_kit/image_icon.png",
    "bmp": "images/tim_kit/image_icon.png",
    "gif": "images/tim_kit/image_icon.png",
    "png": "images/tim_kit/image_icon.png",
    "jpeg": "images/tim_kit/image_icon.png",
    "tif": "images/tim_kit/image_icon.png",
    "wmf": "images/tim_kit/image_icon.png",
    "dib": "images/tim_kit/image_icon.png",
    "mp4": "images/tim_kit/video_icon.png",
    "avi": "images/tim_kit/video_icon.png",
    "mov": "images/tim_kit/video_icon.png",
    "wmv": "images/video_icon.png",
    "flv": "images/video_icon.png",
  };

  Widget _getFileIcon() {
    return Image.asset(
      fileMap[fileFormat?.toLowerCase()] ?? "images/unknown.png",
      // package: 'tencent_cloud_chat_uikit',
    );
  }

  @override
  Widget tuiBuild(BuildContext context, TUIKitBuildValue value) {
    return SizedBox(
      height: size ?? 50,
      width: size ?? 50,
      child: Container(padding: const EdgeInsets.all(4), child: _getFileIcon()),
    );
  }
}
