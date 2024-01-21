package com.example.mixflutter

import android.content.Intent
import android.os.Bundle
import androidx.appcompat.app.AppCompatActivity
import com.example.mixflutter.databinding.ActivityMainBinding
import io.flutter.embedding.android.FlutterActivity
import io.flutter.embedding.android.FlutterFragment
import io.flutter.embedding.engine.FlutterEngine

class MainActivity : AppCompatActivity() {
    private var _binding: ActivityMainBinding? = null
    // This property is only valid between onCreateView and
// onDestroyView.
    private val binding get() = _binding!!
    override fun onCreate(savedInstanceState: Bundle?) {
        super.onCreate(savedInstanceState)
        _binding=ActivityMainBinding.inflate(layoutInflater)
        val view = binding.root
        setContentView(view)

        //todo 使用预热engine 更快渲染
        //https://flutter.cn/docs/add-to-app/android/add-flutter-fragment?tab=launch-with-custom-entrypoint-kotlin-tab
        val flutterFragment = FlutterFragment.createDefault()
        supportFragmentManager.beginTransaction()
            .add(R.id.fragmentContainer,flutterFragment).commit()
        binding.tvTest.setOnClickListener {
            val intent = FlutterActivity
                .withNewEngine()
//                .initialRoute("/my_route")
                .build(this)
            startActivity(intent)
//            startActivity(Intent(this,FlutterActivity::class.java))
        }
    }
}
