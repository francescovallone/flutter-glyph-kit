
import 'glyph_interface_enum.dart';

import 'glyph_interface_sdk_platform_interface.dart';

/// The implementation of [GlyphInterfaceSdk] that uses the platform-specific implementation.
class GlyphInterfaceSdk {
  
  /// Method to get the phone model.
  Future<GlyphCommon?> getPlatform() async {
    final result = await GlyphInterfaceSdkPlatform.instance.getPlatform();
    return switch(result){
      '20111' => GlyphCommon.phone1,
      '20112' => GlyphCommon.phone2,
      _ => null,
    };
  }

  /// Method to create a builder.
  /// This is the first method to be called before any other method.
  Future<String> builder() async {
    return await GlyphInterfaceSdkPlatform.instance.builder();
  }

  /// This method is used to select the led channel to activate.
  /// Should be called after the builder method.
  Future<void> channel({
    required String id,
    required int channel,
  }) async {
    return await GlyphInterfaceSdkPlatform.instance.channel(id: id, channel: channel);
  }

  /// This method is used to build the led channel(s).
  /// This method closes the builder and prepares the led channel(s) for activation.
  Future<void> build({
    required String id,
  }) async {
    return await GlyphInterfaceSdkPlatform.instance.build(id: id);
  }

  /// This method is used to activate the led channel(s).
  /// The led will be turned on statically.
  Future<void> toggle({
    required String id,
  }) async {
    return await GlyphInterfaceSdkPlatform.instance.toggle(id: id);
  }

  /// This method is used to set the period of the led channel(s).
  Future<void> setPeriod({
    required String id,
    required int period,
  }) async {
    return await GlyphInterfaceSdkPlatform.instance.setPeriod(id: id, period: period);
  }

  /// This method is used to set the number of cycles of the led channel(s).
  Future<void> setCycles({
    required String id,
    required int cycles,
  }) async {
    return await GlyphInterfaceSdkPlatform.instance.setCycles(id: id, cycles: cycles);
  }

  /// This method is used to set the interval of the led channel(s).
  Future<void> setInterval({
    required String id,
    required int interval,
  }) async {
    return await GlyphInterfaceSdkPlatform.instance.setInterval(id: id, interval: interval);
  }

  /// This method is used to animate the led channel(s).
  /// The led will be turned on and off repeatedly.
  Future<void> animate({
    required String id,
  }) async {
    return await GlyphInterfaceSdkPlatform.instance.animate(id: id);
  }

}
