import 'package:flutter/services.dart';
import 'package:flutter_glyph_kit/glyph_interface_sdk_method_channel.dart';
import 'package:flutter_test/flutter_test.dart';

void main() {
  TestWidgetsFlutterBinding.ensureInitialized();

  MethodChannelGlyphInterfaceSdk platform = MethodChannelGlyphInterfaceSdk();
  const MethodChannel channel = MethodChannel('glyph_interface_sdk');

  setUp(() {
    TestDefaultBinaryMessengerBinding.instance.defaultBinaryMessenger.setMockMethodCallHandler(
      channel,
      (MethodCall methodCall) async {
        return '42';
      },
    );
  });

  tearDown(() {
    TestDefaultBinaryMessengerBinding.instance.defaultBinaryMessenger.setMockMethodCallHandler(channel, null);
  });

  test('getPlatformVersion', () async {
    expect(await platform.getPlatform(), '42');
  });
}
