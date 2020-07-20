import 'package:flutter_driver/flutter_driver.dart';
import 'package:test/test.dart';

void main() {
  FlutterDriver driver;

  setUpAll(() async => driver = await FlutterDriver.connect());

  tearDownAll(() async => driver?.close());

  test('should create a valid signature', () async {
    // arrange
    final getKeyPairButton = find.byValueKey('getKeyPair');
    final getSecretButton = find.byValueKey('getSecret');
    final getSignatureButton = find.byValueKey('getSignature');
    final verifySignatureButton = find.byValueKey('verifySignature');
    final isValidSignatureText = find.byValueKey('isValidSignature');

    // act
    await driver.tap(getKeyPairButton);
    await driver.tap(getSecretButton);
    await driver.scrollIntoView(getSignatureButton);
    await driver.tap(getSignatureButton);
    await driver.tap(verifySignatureButton);
    final signatureValid = await driver.getText(isValidSignatureText);

    // assert
    expect(signatureValid.endsWith('true'), true);
  });
}
