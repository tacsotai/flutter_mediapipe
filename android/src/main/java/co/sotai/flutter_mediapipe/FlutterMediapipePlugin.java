package co.sotai.flutter_mediapipe;

import android.app.Activity;
import androidx.annotation.NonNull;
import io.flutter.embedding.engine.plugins.FlutterPlugin;
import io.flutter.embedding.engine.plugins.activity.ActivityAware;
import io.flutter.embedding.engine.plugins.activity.ActivityPluginBinding;

import io.flutter.plugin.common.BinaryMessenger;
import io.flutter.plugin.platform.PlatformViewFactory;
import io.flutter.plugin.platform.PlatformViewRegistry;


/**
 * FlutterMediapipePlugin
 */
public class FlutterMediapipePlugin implements FlutterPlugin, ActivityAware {

    public static final String VIEW = "flutter_mediapipe/view";

    private PlatformViewRegistry registry;
    private BinaryMessenger messenger;
    private PlatformViewFactory factory;

    @Override
    public void onAttachedToEngine(@NonNull FlutterPluginBinding binding) {
        registry = binding.getPlatformViewRegistry();
        messenger = binding.getBinaryMessenger();
    }

    @Override
    public void onDetachedFromEngine(@NonNull FlutterPluginBinding binding) {}

    @Override
    public void onAttachedToActivity(@NonNull ActivityPluginBinding binding) {
        factory = new NativeViewFactory(messenger, binding.getActivity());
        registry.registerViewFactory(VIEW, factory);
    }

    @Override
    public void onDetachedFromActivityForConfigChanges() {

    }

    @Override
    public void onReattachedToActivityForConfigChanges(@NonNull ActivityPluginBinding binding) {

    }

    @Override
    public void onDetachedFromActivity() {
        //methodChannel.setMethodCallHandler(null);
    }

}

