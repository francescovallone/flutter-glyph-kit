import 'package:glyph_interface_sdk/glyph_interface_enum.dart';

import 'glyph_interface_sdk.dart';

abstract class Glyph<T> {

  final sdkInterface = GlyphInterfaceSdk();

  Future<void> toggle({
    required List<T> channels,
  });

  Future<void> animate({
    required List<T> channels,
    Duration? duration,
    int? intervalDuration,
    int? cycles
  }){
    throw UnimplementedError('animated() has not been implemented.');
  }

}

class Phone1Glyph extends Glyph<Phone1Led> {

  @override
  Future<void> toggle({
    required List<Phone1Led> channels,
  }) async {
    throw UnimplementedError('toggle() has not been implemented.');
  }

  @override
  Future<void> animate({
    required List<Phone1Led> channels,
    Duration? duration,
    int? intervalDuration,
    int? cycles
  }) async {
    throw UnimplementedError('animated() has not been implemented.');
  }

}

class Phone2Glyph extends Glyph<Phone2Led> {

  @override
  Future<void> toggle({
    required List<Phone2Led> channels,
  }) async {
    final builderId = await super.sdkInterface.builder();
    for (final channel in channels) {
      await super.sdkInterface.channel(id: builderId, channel: channel.value);
    }
    await super.sdkInterface.build(id: builderId);
    await super.sdkInterface.toggle(id: builderId);
  }

  @override
  Future<void> animate({
    required List<Phone2Led> channels,
    Duration? duration,
    int? intervalDuration,
    int? cycles
  }) async {
    final builderId = await super.sdkInterface.builder();
    for (final channel in channels) {
      await super.sdkInterface.channel(id: builderId, channel: channel.value);
    }
    await super.sdkInterface.build(id: builderId);
    // await super.sdkInterface
  }

}