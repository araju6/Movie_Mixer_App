import 'dart:ui';

class ScreenUtil {
  static ScreenUtil _instance;
  static const int defaultWidth = 414;
  static const int defaultHeight = 896;

  static double _screenWidth;
  static double _screenHeight;
  static double _pixelRatio;
  static double _statusBarHeight;

  ScreenUtil._();

  factory ScreenUtil() {
    return _instance;
  }

  static void init({num width = defaultWidth,
    num height = defaultHeight,
    bool allowFontScaling = false}) {
    if (_instance == null) {
      _instance = ScreenUtil._();
    }
    _pixelRatio = window.devicePixelRatio;
    _screenWidth = window.physicalSize.width;
    _screenHeight = window.physicalSize.height;
    _statusBarHeight = window.padding.top;
  }

  static double get pixelRatio => _pixelRatio;
  static double get screenWidth => _screenWidth / _pixelRatio;
  static double get screenHeight => _screenHeight / _pixelRatio;
  static double get screenWidthPx => _screenWidth;
  static double get screenHeightPx => _screenHeight;
  static double get statusBarHeight => _statusBarHeight / _pixelRatio;
  static double get statusBarHeightPx => _statusBarHeight;
}