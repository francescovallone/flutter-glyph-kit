package dev.francescovallone.glyph_interface_sdk

import android.content.ComponentName
import android.content.Context
import android.util.Log
import com.nothing.ketchum.Common
import com.nothing.ketchum.GlyphException
import com.nothing.ketchum.GlyphFrame
import com.nothing.ketchum.GlyphManager
import io.flutter.embedding.engine.plugins.FlutterPlugin
import io.flutter.plugin.common.MethodCall
import io.flutter.plugin.common.MethodChannel
import io.flutter.plugin.common.MethodChannel.MethodCallHandler


/** GlyphInterfaceSdkPlugin */
class GlyphInterfaceSdkPlugin: FlutterPlugin, MethodCallHandler {
  /// The MethodChannel that will the communication between Flutter and native Android
  ///
  /// This local reference serves to register the plugin with the Flutter Engine and unregister it
  /// when the Flutter Engine is detached from the Activity
  private lateinit var channel : MethodChannel
  private var mGM: GlyphManager? = null
  private var mCallback: GlyphManager.Callback? = null

  private var builderMap: MutableMap<String, GlyphFrame.Builder> = mutableMapOf()
  private var frameMap: MutableMap<String, GlyphFrame> = mutableMapOf()

  override fun onAttachedToEngine(flutterPluginBinding: FlutterPlugin.FlutterPluginBinding) {
    channel = MethodChannel(flutterPluginBinding.binaryMessenger, "glyph_interface_sdk")
    onAttach(flutterPluginBinding.applicationContext)
    channel.setMethodCallHandler(this)
  }

  private fun onAttach(applicationContext: Context){
     init();
     mGM = GlyphManager.getInstance(applicationContext);
     mGM?.init(mCallback);
  }

  private fun init() {
    if(!(Common.is20111() || Common.is22111() || Common.is23111())){
      throw RuntimeException("This device is not supported");
    }
    mCallback = object : GlyphManager.Callback {
      override fun onServiceConnected(componentName: ComponentName) {
        if (Common.is20111()){
          val result = mGM?.register(Common.DEVICE_20111)
        }
        if (Common.is22111()){
          val result = mGM?.register(Common.DEVICE_22111)
        }
        if(Common.is23111()){
          val result = mGM?.register(Common.DEVICE_23111)
        }
        try {
          mGM?.openSession()
        } catch (e: GlyphException) {
          Log.d("GlyphIntegrationFlutter", e.message.toString())
        }
      }

      override fun onServiceDisconnected(componentName: ComponentName) {
        mGM?.closeSession()
      }
    }
  }

  override fun onMethodCall(call: MethodCall, result: MethodChannel.Result) {
    when (call.method){
      "builder" -> {
        val x = mGM!!.glyphFrameBuilder
        val id = x.hashCode().toString()
        builderMap[id] = x
        result.success(id)
      }
      "getPlatform" -> {
        if(Common.is20111()){
          result.success("20111")
        }
        if(Common.is22111()){
          result.success("22111")
        }
        result.success("23111")
      }
      "channel" -> {
        val id = call.argument<String>("id") ?: throw Error()
        val channel = call.argument<Int>("channel") ?: throw Error()
        val lightValue = call.argument<Int>("light")
        builderMap[id] = if(lightValue == null){
          builderMap[id]?.buildChannel(channel)!!
        }else{
          builderMap[id]?.buildChannel(channel, lightValue)!!
        }
        result.success(true)
      }
      "build" -> {
        val id = call.argument<String>("id") ?: throw Error()
        frameMap[id] = builderMap[id]?.build()!!
        result.success(true)
      }
      "toggle" -> {
        val id = call.argument<String>("id") ?: throw Error()
        mGM?.toggle(frameMap[id]!!)
        result.success(true)
      }
      "setPeriod" -> {
        val id = call.argument<String>("id") ?: throw Error()
        val period = call.argument<Int>("period") ?: throw Error()
        builderMap[id] = builderMap[id]?.buildPeriod(period)!!
        result.success(true)
      }
      "setCycles" -> {
        val id = call.argument<String>("id") ?: throw Error()
        val cycles = call.argument<Int>("cycles") ?: throw Error()
        builderMap[id] = builderMap[id]?.buildCycles(cycles)!!
        result.success(true)
      }
      "setInterval" -> {
        val id = call.argument<String>("id") ?: throw Error()
        val interval = call.argument<Int>("interval") ?: throw Error()
        builderMap[id] = builderMap[id]?.buildInterval(interval)!!
        result.success(true)
      }
      "animate" -> {
        val id = call.argument<String>("id") ?: throw Error()
        mGM?.animate(frameMap[id]!!)
        result.success(true)
      }
      "getPlatformVersion" -> {
        result.success("Android ${Common.is22111()}")
      }
      else -> result.notImplemented()
    }
  }

  override fun onDetachedFromEngine(binding: FlutterPlugin.FlutterPluginBinding) {
    channel.setMethodCallHandler(null)
      try {
        mGM?.closeSession();
      } catch (e: GlyphException) {
        Log.d("GlyphIntegrationFlutter", e.message.toString())
      }
      mGM?.unInit();
  }
}
