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

  Future<String?> getPlatformVersion() {
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
}
