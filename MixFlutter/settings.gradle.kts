pluginManagement {
    repositories {
        google()
        mavenCentral()
        gradlePluginPortal()
    }
}
dependencyResolutionManagement {
    repositoriesMode.set(RepositoriesMode.PREFER_SETTINGS)
    repositories {
        google()
        mavenCentral()

        // Add the new repositories starting on the next line...
        maven {
            setUrl("some/path/flutter_module/build/host/outputs/repo")
            // This is relative to the location of the build.gradle file
            // if using a relative path.
        }
        maven {
            setUrl("https://storage.googleapis.com/download.flutter.io")
        }
        // ...to before this line
    }
}



rootProject.name = "MixFlutter"
include(":app")
apply { from("flutter_settings.gradle") }
