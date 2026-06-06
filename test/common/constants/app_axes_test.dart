import 'package:doodiary/common/constants/app_axes.dart';
import 'package:flutter_test/flutter_test.dart';

void main() {
  group('AppAxes', () {
    test('7軸すべてが定義されている', () {
      expect(AppAxes.all.length, 7);
    });

    test('Axis7の全enumが all に含まれている', () {
      for (final axis in Axis7.values) {
        expect(AppAxes.all.contains(axis), isTrue, reason: '${axis.name} が all に含まれていない');
      }
    });
  });

  group('Axis7', () {
    test('各軸のlabelが空でない', () {
      for (final axis in Axis7.values) {
        expect(axis.label.isNotEmpty, isTrue, reason: '${axis.name}.label が空');
      }
    });

    test('各軸のcolumnKeyが空でない', () {
      for (final axis in Axis7.values) {
        expect(axis.columnKey.isNotEmpty, isTrue, reason: '${axis.name}.columnKey が空');
      }
    });

    test('columnKeyに重複がない', () {
      final keys = Axis7.values.map((a) => a.columnKey).toList();
      final unique = keys.toSet();
      expect(keys.length, unique.length);
    });
  });
}
