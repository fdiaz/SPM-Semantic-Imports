## Problem Statement

Running `swift build` on this project succeeds, while building after generating and opening the Xcode project fails with:

> Use of '@import' when modules are disabled

[in this line](https://github.com/fdiaz/SPM-Semantic-Imports/blob/3da3fe4db0d0c0dfcc9bb91cd6b1a731dad9a7e6/Sources/ObjcExample/internal/SomeObjc.m#L2).

## Environment

- Xcode 12.0 (12A7208)
- Swift 5.3

## Repro steps

1. Run `swift package generate-xcodeproj`
1. Run `open Example.xcodeproj`
1. Select `Mac` in the simulator dropdown
1. Build Xcode project

## What I've tried

### Overriding configs:

I've tried creating an Settings.xcconfig with the following iterations:

```swift
DEFINES_MODULE = YES;
```

```swift
CLANG_MODULES_AUTOLINK = YES;
CLANG_ENABLE_MODULES = YES;
```

And then running `swift package generate-xcodeproj --xcconfig-overrides Settings.xcconfig`.

This has not worked.

---
## Update: How to fix this

[This PR](https://github.com/fdiaz/SPM-Semantic-Imports/pull/20) exemplifies how to fix this problem
