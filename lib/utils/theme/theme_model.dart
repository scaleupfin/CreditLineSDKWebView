import 'package:deynamic_update/utils/theme/theme.dart';
import 'package:deynamic_update/utils/theme/widget_themes/bottom_sheet_theme.dart';
import 'package:deynamic_update/utils/theme/widget_themes/checkbox_theme.dart';
import 'package:deynamic_update/utils/theme/widget_themes/chip_theme.dart';
import 'package:deynamic_update/utils/theme/widget_themes/elevated_button_theme.dart';
import 'package:deynamic_update/utils/theme/widget_themes/outlined_button_theme.dart';
import 'package:deynamic_update/utils/theme/widget_themes/text_field_theme.dart';
import 'package:deynamic_update/utils/theme/widget_themes/text_theme.dart';
import 'package:flutter/material.dart';

import '../constants/colors.dart';

class ThemeModel extends ChangeNotifier {
  bool _isDarkMode = false;

  ThemeData get currentTheme {
    return _isDarkMode ? TAppTheme.darkTheme : TAppTheme.lightTheme;
  }

  void toggleTheme() {
    _isDarkMode = !_isDarkMode;
    notifyListeners();
  }
}
