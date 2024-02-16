
import 'glyph_interface_enum.dart';

import 'glyph_interface_sdk_platform_interface.dart';

class GlyphInterfaceSdk {
  
  Future<GlyphCommon?> getPlatform() async {
    final result = await GlyphInterfaceSdkPlatform.instance.getPlatform();
    return switch(result){
      '20111' => GlyphCommon.phone1,
      '20112' => GlyphCommon.phone2,
      _ => null,
    };
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

  Future<void> setPeriod({
    required String id,
    required int period,
  }) async {
    return await GlyphInterfaceSdkPlatform.instance.setPeriod(id: id, period: period);
  }

  Future<void> setCycles({
    required String id,
    required int cycles,
  }) async {
    return await GlyphInterfaceSdkPlatform.instance.setCycles(id: id, cycles: cycles);
  }

  Future<void> setInterval({
    required String id,
    required int interval,
  }) async {
    return await GlyphInterfaceSdkPlatform.instance.setInterval(id: id, interval: interval);
  }

  Future<void> animate({
    required String id,
  }) async {
    return await GlyphInterfaceSdkPlatform.instance.animate(id: id);
  }

}
