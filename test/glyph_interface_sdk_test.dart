import 'package:flutter_test/flutter_test.dart';
import 'package:glyph_interface_sdk/glyph_interface_sdk.dart';
import 'package:glyph_interface_sdk/glyph_interface_sdk_platform_interface.dart';
import 'package:glyph_interface_sdk/glyph_interface_sdk_method_channel.dart';
import 'package:plugin_platform_interface/plugin_platform_interface.dart';

class MockGlyphInterfaceSdkPlatform
    with MockPlatformInterfaceMixin
    implements GlyphInterfaceSdkPlatform {

  @override
  Future<String?> getPlatformVersion() => Future.value('42');
}

void main() {
  final GlyphInterfaceSdkPlatform initialPlatform = GlyphInterfaceSdkPlatform.instance;

  test('$MethodChannelGlyphInterfaceSdk is the default instance', () {
    expect(initialPlatform, isInstanceOf<MethodChannelGlyphInterfaceSdk>());
  });

  test('getPlatformVersion', () async {
    GlyphInterfaceSdk glyphInterfaceSdkPlugin = GlyphInterfaceSdk();
    MockGlyphInterfaceSdkPlatform fakePlatform = MockGlyphInterfaceSdkPlatform();
    GlyphInterfaceSdkPlatform.instance = fakePlatform;

    expect(await glyphInterfaceSdkPlugin.getPlatformVersion(), '42');
  });
}
