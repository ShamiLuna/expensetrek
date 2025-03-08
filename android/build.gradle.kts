import org.gradle.api.tasks.compile.JavaCompile

// ✅ Correct way to apply plugins
plugins {
    id("com.android.application") version "8.7.3" apply false
    id("org.jetbrains.kotlin.android") version "2.0.21" apply false
}

buildscript {
    repositories {
        google()
        mavenCentral()
        gradlePluginPortal()
    }
}

subprojects {
    tasks.withType<JavaCompile>().configureEach {
        sourceCompatibility = "17"
        targetCompatibility = "17"
        options.compilerArgs.add("-Xlint:-options") // Fix for Kotlin DSL
    }
}

// ✅ Move the build directory outside the project
val newBuildDir = rootProject.layout.buildDirectory.dir("../../build").get()
rootProject.layout.buildDirectory.set(newBuildDir)

subprojects {
    val newSubprojectBuildDir = newBuildDir.dir(project.name)
    project.layout.buildDirectory.set(newSubprojectBuildDir)
}

// ✅ Ensure subprojects evaluate after ":app"
subprojects {
    evaluationDependsOn(":app")
}

// ✅ Register clean task properly
tasks.register<Delete>("clean") {
    delete(rootProject.layout.buildDirectory)
}
