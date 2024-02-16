import 'package:flutter_glyph_kit/glyph_interface_sdk.dart';
import 'package:flutter_glyph_kit/glyph_interface_sdk_method_channel.dart';
import 'package:flutter_glyph_kit/glyph_interface_sdk_platform_interface.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:plugin_platform_interface/plugin_platform_interface.dart';

class MockGlyphInterfaceSdkPlatform
    with MockPlatformInterfaceMixin
    implements GlyphInterfaceSdkPlatform {

  @override
  Future<String?> getPlatform() => Future.value('42');
  
  @override
  Future<void> animate({required String id}) {
    // TODO: implement animate
    throw UnimplementedError();
  }
  
  @override
  Future<void> build({required String id}) {
    // TODO: implement build
    throw UnimplementedError();
  }
  
  @override
  Future<String> builder() {
    // TODO: implement builder
    throw UnimplementedError();
  }
  
  @override
  Future<void> channel({required String id, required int channel}) {
    // TODO: implement channel
    throw UnimplementedError();
  }
  
  @override
  Future<void> setCycles({required String id, required int cycles}) {
    // TODO: implement setCycles
    throw UnimplementedError();
  }
  
  @override
  Future<void> setInterval({required String id, required int interval}) {
    // TODO: implement setInterval
    throw UnimplementedError();
  }
  
  @override
  Future<void> setPeriod({required String id, required int period}) {
    // TODO: implement setPeriod
    throw UnimplementedError();
  }
  
  @override
  Future<void> toggle({required String id}) {
    // TODO: implement toggle
    throw UnimplementedError();
  }
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

    expect(await glyphInterfaceSdkPlugin.getPlatform(), '42');
  });
}
