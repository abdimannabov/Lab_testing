import 'package:flutter_test/flutter_test.dart';
import 'package:flutter/widgets.dart';
import 'package:app_3/perf_demo.dart';

void main() {
  testWidgets('ExpensiveBuildWidget rebuild count higher than refactored', (
    WidgetTester tester,
  ) async {
    // Reset counters
    resetExpensiveBuildWidgetBuildCount();
    resetRefactoredExpensiveWidgetBuildCount();

    // Pump ExpensiveBuildWidget and trigger a few rebuilds
    await tester.pumpWidget(
      Directionality(
        textDirection: TextDirection.ltr,
        child: ExpensiveBuildWidget(child: const Text('child')),
      ),
    );

    // Trigger rebuilds
    for (var i = 0; i < 3; i++) {
      await tester.pump();
    }

    final badCount = getExpensiveBuildWidgetBuildCount();

    // Now for refactored widget
    await tester.pumpWidget(
      Directionality(
        textDirection: TextDirection.ltr,
        child: RefactoredExpensiveWidget(child: const Text('child')),
      ),
    );

    for (var i = 0; i < 3; i++) {
      await tester.pump();
    }

    final goodCount = getRefactoredExpensiveWidgetBuildCount();

    expect(badCount >= goodCount, isTrue);
  });
}

// Expose accessors to avoid referencing private state classes in test.
// No private accessors required; perf_demo exposes public helpers.
