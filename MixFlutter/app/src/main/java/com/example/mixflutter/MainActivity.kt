package com.example.mixflutter

import android.content.Intent
import android.os.Bundle
import android.util.Log
import androidx.appcompat.app.AppCompatActivity
import com.example.mixflutter.databinding.ActivityMainBinding
import io.flutter.embedding.android.FlutterActivity
import io.flutter.embedding.android.FlutterFragment
import io.flutter.embedding.engine.FlutterEngine
import io.flutter.plugin.common.MethodCall
import io.flutter.plugin.common.MethodChannel

class MainActivity : AppCompatActivity() {
    private var _binding: ActivityMainBinding? = null

    // This property is only valid between onCreateView and
// onDestroyView.
    private val binding get() = _binding!!
    override fun onCreate(savedInstanceState: Bundle?) {
        super.onCreate(savedInstanceState)
        _binding = ActivityMainBinding.inflate(layoutInflater)
        val view = binding.root
        setContentView(view)

        //todo 使用预热engine 更快渲染
        //https://flutter.cn/docs/add-to-app/android/add-flutter-fragment?tab=launch-with-custom-entrypoint-kotlin-tab
        val flutterFragment = FlutterFragment.createDefault()
        supportFragmentManager.beginTransaction()
            .add(R.id.fragmentContainer, flutterFragment).commit()
        binding.tvTest.setOnClickListener {
            val intent = FlutterActivity
                .withNewEngine()
//                .initialRoute("/my_route")
                .build(this)
            startActivity(intent)
//            startActivity(Intent(this,FlutterActivity::class.java))
        }
        binding.tvSendMessage.post {
            registerWith(flutterFragment.flutterEngine!!)
        }

        binding.tvSendMessage.setOnClickListener {
            sentMessage(flutterFragment.flutterEngine!!)
        }
    }

    private fun registerWith(flutterEngine: FlutterEngine) {
        val methodChannel =
            MethodChannel(flutterEngine.dartExecutor.binaryMessenger, "MethodChannel")
        //监听flutter调用
        methodChannel.setMethodCallHandler { call, result ->
            Log.i(Companion.TAG, "registerWith: ${call.arguments}")
            when (call.method) {
                "flutterCallNative" -> {
                    result.success("我是native，收到你传来的消息了")
                }

                else -> {
                    result.notImplemented()
                }
            }
        }

    }

    private fun sentMessage(flutterEngine: FlutterEngine) {
        val methodChannel =
            MethodChannel(flutterEngine.dartExecutor.binaryMessenger, "MethodChannel")
        //调用flutter方法
        methodChannel.invokeMethod("methodName", "我是native，这是向flutter发的信息",
            object : MethodChannel.Result {
                override fun success(result: Any?) {
                    Log.i(TAG, "success: $result")
                }

                override fun error(errorCode: String, errorMessage: String?, errorDetails: Any?) {
                    Log.i(TAG, "error: $errorMessage")
                }

                override fun notImplemented() {
                    Log.i(TAG, "notImplemented: ")
                }

            })
    }

    companion object {
        private const val TAG = "MainActivity"
    }
}
