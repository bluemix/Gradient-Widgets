import 'package:flutter_driver/flutter_driver.dart';
import 'package:test/test.dart';

void main() {
  group('basic launch test', () {
    final SerializableFinder firstGradientButton =
        find.byValueKey('Hot Linear');
    final SerializableFinder firstCircularGradientButton =
        find.byValueKey('Circular Hot Linear');

    FlutterDriver? driver;

    setUpAll(() async {
      driver = await FlutterDriver.connect();
    });

    tearDownAll(() async {
      await driver?.close();
    });

    test('tapping buttons', () async {
      await driver?.runUnsynchronized(() async {
        //      var layoutTree = await driver.getLayerTree();
//      print('layoutTree.toJson(): ${layoutTree.toJson()}');

//      var renderTree = await driver.getRenderTree();
//      print('renderTree.toJson(): ${renderTree.toJson()}');

        print('will tap on the first GradientButton...');
        await driver?.tap(firstGradientButton);

        print('will tap on the first CircularGradientButton');
        await driver?.tap(firstCircularGradientButton);
      });
    });
  });
}
