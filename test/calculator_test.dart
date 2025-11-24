import 'package:flutter_test/flutter_test.dart';
import 'package:app_3/calculator.dart';

void main() {
  group('Calculator.add()', (){
    test('adds 2 positive numbers', (){
      final calc = Calculator();

      final result = calc.add(3, 7);
      expect(result, 10);
    });

    test('adds 2 negative numbers', (){
      final calc = Calculator();

      final result = calc.add(-2, -7);

      expect(result, -9);
    });

    test('adds pos and neg numbers', (){
      final calc = Calculator();

      final result = calc.add(-5, 9);

      expect(result, 4);
    });

    test('adds 0 t 0', (){
      final calc = Calculator();

      final result = calc.add(0, 0);

      expect(result, 0);
    });

    test('adds pos to 0', (){
      final calc = Calculator();

      final result = calc.add(6, 0);

      expect(result, 6);
    });

    test('adds 0 to neg number', (){
      final calc = Calculator();

      final result = calc.add(0, -9);

      expect(result, -9);
    });
  });
}