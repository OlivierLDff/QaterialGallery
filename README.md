# QQuickMaterialHelperGallery

QQuickMaterialHelperGallery is a showcase application and contains example for the library QQuickMaterialHelper.

## Components

### Buttons

![](./doc/screen2.png)

* Raised Button
* Flat Button
* Outlined Button

etc ...

## Build

QQuickMaterialHelperGallery is a cross platform application that can be build natively or cross compiled. Qt precompiled binary are required and can be download from the [official website](http://download.qt.io/archive/qt/). Then simply use the qt manager to install the toolchain that you need. Minimum Qt version is `5.12`.

### Windows

To build the application for windows it is required to already be on a windows machine. It is recommended to export the path as global variable.

```bash
export QT_WIN_VERSION=5.12.0
export QT_DIR_MINGW32=C:/Qt/$QT_WIN_VERSION/mingw53_32
export QT_DIR_MINGW64=C:/Qt/$QT_WIN_VERSION/mingw53_64
export QT_DIR_MSVC32=C:/Qt/$QT_WIN_VERSION1/msvc2017_32
export QT_DIR_MSVC64=C:/Qt/$QT_WIN_VERSION/msvc2017_64
```

Then simply clone the repository and create an in source build folder.

```bash
git clone https://github.com/Ereimul/QQuickMaterialHelperGallery 
cd QQuickMaterialHelperGallery && mkdir build && cd build
```

**MinGw 32 bits - Make**

```bash
cmake -DCMAKE_PREFIX_PATH=$QT_DIR_MINGW32 \
-G "Unix Makefiles" -DCMAKE_BUILD_TYPE=$QT_BUILD_TYPE path/to/CMakeLists/
```

**MinGw 64 bits - Ninja**

```bash
cmake -DCMAKE_PREFIX_PATH=$QT_DIR_MINGW64 \
-G "Ninja" -DCMAKE_BUILD_TYPE=$QT_BUILD_TYPE path/to/CMakeLists/
```

**Msvc 32 bits *(Default)***

```bash
cmake -DCMAKE_PREFIX_PATH=$QT_DIR_MSVC32 \
-G "Visual Studio 15 2017" path/to/CMakeLists/
```

**Msvc 64 bits**

```bash
cmake -DCMAKE_PREFIX_PATH=$QT_DIR_MSVC64 \
-G "Visual Studio 15 2017 Win64" path/to/CMakeLists/
```

### Linux

*TODO*

### Mac

*TODO*

### Android

#### Requirement

- [Android SDK Tools](https://developer.android.com/studio/index.html)
- [The Android NDK](http://developer.android.com/tools/sdk/ndk/index.html) *If installing Android Studio ndk comes with the SDK in `$SDK_PATH/ndk_bundle/`*.
- [Java SE Development Kit](http://www.oracle.com/technetwork/java/javase/downloads/jdk7-downloads-1880260.html) (JDK) v6 or later. You can also use [OpenJDK](http://openjdk.java.net/) on Linux.

#### Environment variable

You need to the following environment variable to be set.

- `ANDROID_SDK` : Path to the Android Sdk.
- `ANDROID_NDK` : Path to the Android Ndk
- `JAVA_HOME` : Path to the Java (mainly to use the jarsigner utility).

To build the application for windows it is required to already be on a windows machine. It is recommended to export the path as global variable.

```bash
export QT_ANDROID_VERSION=5.12.0
## On Windows
export QT_DIR_ARMV7A=C:/Qt/$QT_ANDROID_VERSION/android_armv7
export QT_DIR_ARM64V8A=C:/Qt/$QT_WIN_VERSION1/android_arm64_v8a
export QT_DIR_X86=C:/Qt/$QT_WIN_VERSION/android_x86
## On UNIX system
export QT_DIR_ARMV7A=Path/To/Qt/$QT_ANDROID_VERSION/android_armv7
export QT_DIR_ARM64V8A=Path/To/Qt/$QT_WIN_VERSION1/android_arm64_v8a
export QT_DIR_X86=Path/To/Qt/$QT_WIN_VERSION/android_x86
```

*Due to a bug in gcc it is recommended to use clang.*

Depending on Qt Version you might need to change the Android STL.

- `5.12` : `c++_shared`
- `5.11` : `gnustl_shared`

**CMAKE_BUILD_TYPE** can be set to multiple values. *Debug | Release | MinSizeRel | RelWithDebInfo*.

*Tip for windows: If you don't have make installed you can use the one in the ndk:* 

```bash
-DCMAKE_MAKE_PROGRAM="$ANDROID_NDK/prebuilt/windows-x86_64/bin/make.exe"
```

#### Arm v7a

```bash
mkdir build-android-armeabi-v7a && cd build-android-armeabi-v7a
cmake -DQT_DIR=$QT_DIR_ARMV7A -G "Unix Makefiles" \
-DCMAKE_TOOLCHAIN_FILE=$ANDROID_NDK/build/cmake/android.toolchain.cmake \
-DCMAKE_BUILD_TYPE=Release \
-DANDROID_ABI=armeabi-v7a \
-DANDROID_NATIVE_API_LEVEL=27 \
-DANDROID_STL=c++_shared \
-DANDROID_TOOLCHAIN=clang \
-DQQUICKMATERIALHELPERGALLERY_BUILD_SHARED=ON \
-DQQUICKMATERIALHELPERGALLERY_ANDROID_KEYSTORE=Path/To/Keystore \
-DQQUICKMATERIALHELPERGALLERY_ANDROID_KEYSTORE_ALIAS=KeystoreAlias \
-DQQUICKMATERIALHELPERGALLERY_ANDROID_KEYSTORE_PASSWORD=xxxx \
..
make -j8
```

The resulted apk will be in `PsnViewer-armeabi-v7a/build/outputs/apk/release/`.

#### Arm64 v8a

```bash
mkdir build-android-arm64-v8a && cd build-android-arm64-v8a
cmake -DQT_DIR=$QT_DIR_ARM64V8A -G "Unix Makefiles" \
-DCMAKE_TOOLCHAIN_FILE=$ANDROID_NDK/build/cmake/android.toolchain.cmake \
-DCMAKE_BUILD_TYPE=Release \
-DANDROID_ABI=arm64-v8a \
-DANDROID_NATIVE_API_LEVEL=27 \
-DANDROID_STL=c++_shared \
-DANDROID_TOOLCHAIN=clang \
-DQQUICKMATERIALHELPERGALLERY_ANDROID_KEYSTORE=Path/To/Keystore \
-DQQUICKMATERIALHELPERGALLERY_ANDROID_KEYSTORE_ALIAS=KeystoreAlias \
-DQQUICKMATERIALHELPERGALLERY_ANDROID_KEYSTORE_PASSWORD=xxxx \
..
make -j8
```

The resulted apk will be in `PsnViewer-arm64-v8a/build/outputs/apk/release/`.

#### x86

```bash
mkdir build-android-x86 && cd build-android-x86
cmake -DQT_DIR=$QT_DIR_X86 -G "Unix Makefiles" \
-DCMAKE_TOOLCHAIN_FILE=$ANDROID_NDK/build/cmake/android.toolchain.cmake \
-DCMAKE_BUILD_TYPE=Release \
-DANDROID_ABI=x86 \
-DANDROID_NATIVE_API_LEVEL=27 \
-DANDROID_STL=c++_shared \
-DANDROID_TOOLCHAIN=clang \
-DQQUICKMATERIALHELPERGALLERY_BUILD_SHARED=ON \
-DQQUICKMATERIALHELPERGALLERY_ANDROID_KEYSTORE=Path/To/Keystore \
-DQQUICKMATERIALHELPERGALLERY_ANDROID_KEYSTORE_ALIAS=KeystoreAlias \
-DQQUICKMATERIALHELPERGALLERY_ANDROID_KEYSTORE_PASSWORD=xxxx \
..
make -j8
```

The resulted apk will be in `PsnViewer-x86/build/outputs/apk/release/`.

### Ios

*TODO*

## Configuration

### Input

*Note: Exe, Shared and Static can't be ON at the same time.*

* **QQUICKMATERIALHELPERGALLERY_BUILD_SHARED** : Build as a shared library [ON OFF]. *Default: OFF*.
* **QQUICKMATERIALHELPERGALLERY_BUILD_STATIC** : Build as a static library [ON OFF]. *Default: OFF*.
* **QQUICKMATERIALHELPERGALLERY_BUILD_EXE** : Build as an executable [ON OFF]. *Default: ON*.
* **QQUICKMATERIALHELPERGALLERY_PROJECT** : Name of the project. *Default: QQuickMaterialHelperGallery*.
* **QQUICKMATERIALHELPERGALLERY_TARGET** : Name of the project. *Default: QQuickMaterialHelperGallery*.
* **QQUICKMATERIALHELPERGALLERY_USE_NAMESPACE** : Should the library be compiled with a namespace. *Default: ON*.
* **QQUICKMATERIALHELPERGALLERY_NAMESPACE** : Namespace of the library ig **QQUICKMATERIALHELPERGALLERY_USE_NAMESPACE** is ON. *Default : Erdm.*

### Dependencies

### Output

* **QQUICKMATERIALHELPERGALLERY_TARGET** : Output target to link to. *Default: QQuickMaterialHelperGallery*

## Versions

To create a new release: 

* Update in `CMakelist.txt` variables **QQUICKMATERIALHELPERGALLERY_VERSION_MAJOR**, **QQUICKMATERIALHELPERGALLERY_VERSION_MINOR**, **QQUICKMATERIALHELPERGALLERY_VERSION_PATCH**.
* Increment in `platform/PostBuildPlatform.cmake` the parameter **VERSION_CODE** in the android apk macro

## Authors

* [Olivier Le Doeuff](https://github.com/OlivierLDff)
