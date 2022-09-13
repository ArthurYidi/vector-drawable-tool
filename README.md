### Native Executable

Blocked on: https://github.com/oracle/graal/issues/4124

```
plugins {
  id 'org.graalvm.buildtools.native' version "0.9.13"
}

graalvmNative {
    testSupport = false
    binaries {
        main {
            imageName = "vd-tool-native"
            mainClass = "com.android.ide.common.vectordrawable.VdCommandLineTool"
            sharedLibrary = false
            buildArgs.add('--initialize-at-build-time=com.google.common.jimfs.SystemJimfsFileSystemProvider')
        }
    }
}
```
