package co.sotai.flutter_mediapipe;

import android.app.Activity;
import android.content.Context;
import android.content.pm.ApplicationInfo;
import android.content.pm.PackageManager;
import android.graphics.SurfaceTexture;
import android.os.Handler;
import android.os.Looper;
import android.util.Log;
import android.util.Size;
import android.view.SurfaceHolder;
import android.view.SurfaceView;
import android.view.View;

import androidx.annotation.NonNull;
import androidx.annotation.Nullable;

import com.google.mediapipe.components.*;
import com.google.mediapipe.components.CameraHelper;
import com.google.mediapipe.components.CameraXPreviewHelper;
import com.google.mediapipe.components.ExternalTextureConverter;
import com.google.mediapipe.components.FrameProcessor;
import com.google.mediapipe.formats.proto.LandmarkProto.NormalizedLandmarkList;
import com.google.mediapipe.framework.AndroidAssetUtil;
import com.google.mediapipe.framework.AndroidPacketCreator;
import com.google.mediapipe.framework.Packet;
import com.google.mediapipe.framework.PacketCallback;
import com.google.mediapipe.framework.PacketGetter;
import com.google.mediapipe.glutil.EglManager;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import io.flutter.plugin.common.BinaryMessenger;
import io.flutter.plugin.common.EventChannel;
import io.flutter.plugin.common.MethodCall;
import io.flutter.plugin.common.MethodChannel;
import io.flutter.plugin.common.MethodChannel.MethodCallHandler;
import io.flutter.plugin.common.MethodChannel.Result;
import io.flutter.plugin.platform.PlatformView;

public class NativeView implements PlatformView, MethodCallHandler {

    private static final String TAG = "FlutterMediapipePlugin";

    private static final String INPUT_NUM_FACES_SIDE_PACKET_NAME = "num_faces";
    private static final String OUTPUT_LANDMARKS_STREAM_NAME = "multi_face_landmarks";

    private static final String BINARY_GRAPH_NAME = "face_mesh_mobile_gpu.binarypb";
    private static final String INPUT_VIDEO_STREAM_NAME = "input_video";
    private static final String OUTPUT_VIDEO_STREAM_NAME = "output_video";

    private static final boolean FLIP_FRAMES_VERTICALLY = true;

    private static final int NUM_FACES = 1;

    private MethodChannel methodChannel;
    private EventChannel eventChannel;
    private EventChannel.EventSink eventSink;
    private Activity activity;

    private ApplicationInfo applicationInfo;

    // Sends camerapreview frames into a MediaPipe graph for processing, and
    // displays the processed
    // frames onto a {@link Surface}.
    protected FrameProcessor processor;
    // Handles camera access via the {@link CameraX} Jetpack support library.
    protected CameraXPreviewHelper cameraHelper;

    // {@link SurfaceTexture} where the camerapreview frames can be accessed.
    private SurfaceTexture previewFrameTexture;
    // {@link SurfaceView} that displays the camerapreview frames processed by a
    // MediaPipe graph.
    private SurfaceView previewDisplayView;

    // Creates and manages an {@link EGLContext}.
    private EglManager eglManager;
    // Converts the GL_TEXTURE_EXTERNAL_OES texture from Android camera into a
    // regular texture to be
    // consumed by {@link FrameProcessor} and the underlying MediaPipe graph.
    private ExternalTextureConverter converter;
    // For event channel
    private final Handler handler = new Handler(Looper.getMainLooper());

    NativeView(@NonNull Context context, int id, @Nullable Map<String, Object> creationParams,
               BinaryMessenger messenger, Activity activity) {
        this.activity = activity;
        try {
            applicationInfo = activity.getPackageManager()
                    .getApplicationInfo(activity.getPackageName(), PackageManager.GET_META_DATA);
        } catch (Exception e) {
            Log.e(TAG, "Cannot find application info: " + e);
        }

        setChannel(messenger);
        setupPreviewDisplayView(activity);
        AndroidAssetUtil.initializeNativeAssetManager(activity);
        setupProcess(activity);
        PermissionHelper.checkAndRequestCameraPermissions(activity);
        onResume();
    }

    private void setupProcess(Activity activity) {
        eglManager = new EglManager(null);
        processor = new FrameProcessor(activity, eglManager.getNativeContext(), BINARY_GRAPH_NAME,
                INPUT_VIDEO_STREAM_NAME, OUTPUT_VIDEO_STREAM_NAME);
        AndroidPacketCreator packetCreator = processor.getPacketCreator();
        Map<String, Packet> inputSidePackets = new HashMap<>();
        inputSidePackets.put(INPUT_NUM_FACES_SIDE_PACKET_NAME,
                packetCreator.createInt32(NUM_FACES));
        processor.setInputSidePackets(inputSidePackets);
        processor.getVideoSurfaceOutput().setFlipY(FLIP_FRAMES_VERTICALLY);

        processor.addPacketCallback(OUTPUT_LANDMARKS_STREAM_NAME, callback());
    }

    private void setChannel(BinaryMessenger messenger) {
        methodChannel = new MethodChannel(messenger, "sotai.co/flutter_mediapipe");
        methodChannel.setMethodCallHandler(this);
        eventChannel = new EventChannel(messenger, "sotai.co/flutter_mediapipe_event");
        eventChannel.setStreamHandler(landMarksStreamHandler());
    }

    private void onResume() {
        converter = new ExternalTextureConverter(eglManager.getContext());
        converter.setFlipY(FLIP_FRAMES_VERTICALLY);
        converter.setConsumer(processor);
        if (PermissionHelper.cameraPermissionsGranted(activity))
            startCamera();
    }


    private EventChannel.StreamHandler landMarksStreamHandler() {
        return new EventChannel.StreamHandler() {

            @Override
            public void onListen(Object arguments, EventChannel.EventSink events) {
                eventSink = events;
            }

            @Override
            public void onCancel(Object arguments) {
                eventSink = null;
            }
        };
    }

    protected Size cameraTargetResolution() {
        return null; // No preference and let the camera (helper) decide.
    }

    public void startCamera() {
        cameraHelper = new CameraXPreviewHelper();
        cameraHelper.setOnCameraStartedListener(new CameraXPreviewHelper.OnCameraStartedListener() {
            @Override
            public void onCameraStarted(@Nullable SurfaceTexture surfaceTexture) {
                previewFrameTexture = surfaceTexture;
                previewDisplayView.setVisibility(View.VISIBLE);
            }
        });
        try {
            cameraHelper.startCamera(activity, CameraHelper.CameraFacing.FRONT, null,
                    cameraTargetResolution());
        } catch (Exception e) {
            Log.e(TAG, "Error has occuer at camera start: " + e);
        }
    }

    @Override
    public void onMethodCall(@NonNull MethodCall call, @NonNull Result result) {

        if (call.method.equals("getPlatformVersion")) {
            result.success("Android " + android.os.Build.VERSION.RELEASE);
        } else {
            result.notImplemented();
        }

    }

    @Override
    public SurfaceView getView() {
        return previewDisplayView;
    }

    @Override
    public void dispose() {
    }

    private void setupPreviewDisplayView(Activity activity) {
        previewDisplayView = new SurfaceView(activity);
        previewDisplayView.setVisibility(View.GONE);

        previewDisplayView.getHolder().addCallback(new SurfaceHolder.Callback() {
            @Override
            public void surfaceCreated(SurfaceHolder holder) {
                processor.getVideoSurfaceOutput().setSurface(holder.getSurface());
            }

            @Override
            public void surfaceChanged(SurfaceHolder holder, int format, int width, int height) {
                onPreviewDisplaySurfaceChanged(holder, format, width, height);
            }

            @Override
            public void surfaceDestroyed(SurfaceHolder holder) {
                processor.getVideoSurfaceOutput().setSurface(null);
            }
        });

    }

    protected void onPreviewDisplaySurfaceChanged(SurfaceHolder holder, int format, int width,
                                                  int height) {
        // (Re)Compute the ideal size of the camerapreview display (the area that the
        // camerapreview frames get rendered onto, potentially with scaling and rotation)
        // based on the size of the SurfaceView that contains the display.
        Size viewSize = computeViewSize(width, height);
        Size displaySize = cameraHelper.computeDisplaySizeFromViewSize(viewSize);
        boolean isCameraRotated = cameraHelper.isCameraRotated();

        // Connect the converter to the camerapreview frames as its input (via
        // previewFrameTexture), and configure the output width and height as the computed
        // display size.
        converter.setSurfaceTextureAndAttachToGLContext(
                previewFrameTexture,
                isCameraRotated ? displaySize.getHeight() : displaySize.getWidth(),
                isCameraRotated ? displaySize.getWidth() : displaySize.getHeight());
    }

    protected Size computeViewSize(int width, int height) {
        return new Size(width, height);
    }

    private PacketCallback callback() {
        return new PacketCallback() {
            @Override
            public void process(final Packet packet) {
                handler.post(new Runnable() {
                    List<NormalizedLandmarkList> landmarkList =
                    PacketGetter.getProtoVector(packet, NormalizedLandmarkList.parser());
                    @Override
                    public void run() {
                        for(NormalizedLandmarkList l:landmarkList){
                            eventSink.success(l.toByteArray());
                        }
                    }
                });
            }
        };
    }
}