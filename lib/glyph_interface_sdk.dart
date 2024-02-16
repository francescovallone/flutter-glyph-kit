
import 'glyph_interface_sdk_platform_interface.dart';

class GlyphInterfaceSdk {
  Future<String?> getPlatformVersion() {
    return GlyphInterfaceSdkPlatform.instance.getPlatformVersion();
  }

  Future<String> builder() async {
    return await GlyphInterfaceSdkPlatform.instance.builder();
  }

  Future<void> channel({
    required String id,
    required int channel,
  }) async {
    return await GlyphInterfaceSdkPlatform.instance.channel(id: id, channel: channel);
  }

  Future<void> build({
    required String id,
  }) async {
    return await GlyphInterfaceSdkPlatform.instance.build(id: id);
  }

  Future<void> toggle({
    required String id,
  }) async {
    return await GlyphInterfaceSdkPlatform.instance.toggle(id: id);
  }

}
