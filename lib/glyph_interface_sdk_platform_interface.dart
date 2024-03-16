import 'package:plugin_platform_interface/plugin_platform_interface.dart';

import 'glyph_interface_sdk_method_channel.dart';

abstract class GlyphInterfaceSdkPlatform extends PlatformInterface {
  /// Constructs a GlyphInterfaceSdkPlatform.
  GlyphInterfaceSdkPlatform() : super(token: _token);

  static final Object _token = Object();

  static GlyphInterfaceSdkPlatform _instance = MethodChannelGlyphInterfaceSdk();

  /// The default instance of [GlyphInterfaceSdkPlatform] to use.
  ///
  /// Defaults to [MethodChannelGlyphInterfaceSdk].
  static GlyphInterfaceSdkPlatform get instance => _instance;

  /// Platform-specific implementations should set this with their own
  /// platform-specific class that extends [GlyphInterfaceSdkPlatform] when
  /// they register themselves.
  static set instance(GlyphInterfaceSdkPlatform instance) {
    PlatformInterface.verifyToken(instance, _token);
    _instance = instance;
  }

  Future<String?> getPlatform() {
    throw UnimplementedError('platformVersion() has not been implemented.');
  }

  Future<String> builder() {
    throw UnimplementedError('builder() has not been implemented.');
  }

  Future<void> channel({
    required String id,
    required int channel,
  }) {
    throw UnimplementedError('channel() has not been implemented.');
  }

  Future<void> build({
    required String id,
  }) {
    throw UnimplementedError('build() has not been implemented.');
  }

  Future<void> toggle({
    required String id,
  }) {
    throw UnimplementedError('toggle() has not been implemented.');
  }

  Future<void> setPeriod({
    required String id,
    required int period,
  }) {
    throw UnimplementedError('setPeriod() has not been implemented.');
  }

  Future<void> setCycles({
    required String id,
    required int cycles,
  }) {
    throw UnimplementedError('setCycles() has not been implemented.');
  }

  Future<void> setInterval({
    required String id,
    required int interval,
  }) {
    throw UnimplementedError('setInterval() has not been implemented.');
  }

  Future<void> animate({
    required String id,
  }) {
    throw UnimplementedError('animate() has not been implemented.');
  }
}
