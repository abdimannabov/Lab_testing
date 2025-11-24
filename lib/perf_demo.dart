import 'package:flutter/widgets.dart';

/// A small demo widget that intentionally does work in build to simulate
/// an expensive rebuild. Useful for measuring rebuild counts in tests.
class ExpensiveBuildWidget extends StatefulWidget {
  final Widget child;

  const ExpensiveBuildWidget({Key? key, required this.child}) : super(key: key);

  @override
  State<ExpensiveBuildWidget> createState() => _ExpensiveBuildWidgetState();
}

class _ExpensiveBuildWidgetState extends State<ExpensiveBuildWidget> {
  static int buildCount = 0;

  @override
  Widget build(BuildContext context) {
    // Simulate light work on each build
    buildCount++;
    final work = List<int>.generate(
      1000,
      (i) => i,
    ).fold<int>(0, (p, e) => p + e);
    // use work to avoid optimization
    return Directionality(
      textDirection: TextDirection.ltr,
      child: Column(children: [widget.child, Text('work:$work')]),
    );
  }
}

// Expose helpers to allow tests to read/reset the counters
int getExpensiveBuildWidgetBuildCount() =>
    _ExpensiveBuildWidgetState.buildCount;
void resetExpensiveBuildWidgetBuildCount() =>
    _ExpensiveBuildWidgetState.buildCount = 0;

/// A refactored widget that avoids repeated work by moving the expensive
/// computation out of the child build path.
class RefactoredExpensiveWidget extends StatefulWidget {
  final Widget child;

  const RefactoredExpensiveWidget({Key? key, required this.child})
    : super(key: key);

  @override
  State<RefactoredExpensiveWidget> createState() =>
      _RefactoredExpensiveWidgetState();
}

class _RefactoredExpensiveWidgetState extends State<RefactoredExpensiveWidget> {
  static int buildCount = 0;
  late final int work;

  @override
  void initState() {
    super.initState();
    // compute once
    work = List<int>.generate(1000, (i) => i).fold<int>(0, (p, e) => p + e);
  }

  @override
  Widget build(BuildContext context) {
    buildCount++;
    return Directionality(
      textDirection: TextDirection.ltr,
      child: Column(children: [widget.child, Text('work:$work')]),
    );
  }
}

int getRefactoredExpensiveWidgetBuildCount() =>
    _RefactoredExpensiveWidgetState.buildCount;
void resetRefactoredExpensiveWidgetBuildCount() =>
    _RefactoredExpensiveWidgetState.buildCount = 0;
