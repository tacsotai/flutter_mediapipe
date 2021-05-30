package co.sotai.flutter_mediapipe;

import android.app.Activity;
import android.content.Context;
import android.view.View;
import androidx.annotation.Nullable;
import androidx.annotation.NonNull;
import io.flutter.plugin.common.BinaryMessenger;
import io.flutter.plugin.common.StandardMessageCodec;
import io.flutter.plugin.platform.PlatformView;
import io.flutter.plugin.platform.PlatformViewFactory;
import java.util.Map;

import io.flutter.plugin.common.StandardMessageCodec;

public class NativeViewFactory extends PlatformViewFactory {

  static {
    System.loadLibrary("mediapipe_jni");
    System.loadLibrary("opencv_java3");
  }

  @NonNull
  private final BinaryMessenger messenger;
  @NonNull
  private final Activity activity;

  private NativeView nativeView;

  public NativeViewFactory(BinaryMessenger messenger, Activity activity) {
    super(StandardMessageCodec.INSTANCE);
    this.messenger = messenger;
    this.activity = activity;
  }

  @NonNull
  @Override
  @SuppressWarnings("unchecked")
  public PlatformView create(@NonNull Context context, int id, @Nullable Object args) {
    final Map<String, Object> creationParams = (Map<String, Object>) args;
    nativeView = new NativeView(context, id, creationParams, messenger, activity);
    return nativeView;
  }

  public NativeView getNativeView(){
    return nativeView;
  }
}
