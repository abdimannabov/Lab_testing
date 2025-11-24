import 'package:flutter_test/flutter_test.dart';
import 'package:flutter/material.dart';

import '../lib/main.dart';

void main() {
  testWidgets('App layout on multiple device sizes does not throw overflow', (
    WidgetTester tester,
  ) async {
    final sizes = [
      Size(320, 568), // small phone
      Size(412, 915), // large phone
      Size(800, 1280), // tablet portrait
      Size(1280, 800), // tablet landscape
    ];

    final originalSize = tester.binding.window.physicalSize;
    final originalRatio = tester.binding.window.devicePixelRatio;

    for (final size in sizes) {
      tester.binding.window.physicalSizeTestValue = size;
      tester.binding.window.devicePixelRatioTestValue = 1.0;

      await tester.pumpWidget(const MyApp());
      await tester.pumpAndSettle();

      // We assert that no overflow exceptions were reported.
      expect(tester.takeException(), isNull);
    }

    // restore
    tester.binding.window.physicalSizeTestValue = originalSize;
    tester.binding.window.devicePixelRatioTestValue = originalRatio;
  });
}
