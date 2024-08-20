import 'package:flutter/material.dart';

extension Darkmode on BuildContext {
  bool get Isdarkmode {
    return Theme.of(this).brightness == Brightness.dark;
  }
}
