import 'package:flutter/foundation.dart';

class Recommendations {
  final int index;
  final String title;

  const Recommendations({
    @required this.index,
    @required this.title,
  })  : assert(index >= 0, 'index cannot be negative'),
        assert(title != null, 'title cannot be null');
}