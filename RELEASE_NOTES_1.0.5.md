# Release Notes - Version 1.0.5

Release Date: May 27, 2025

## Overview

This release fixes an important issue with package integration in other Swift packages. We've resolved the "Static property 'module' is internal and cannot be referenced from a default argument value" error that occurred when importing this package into other packages.

## Fixed Issues

- Fixed the inability to use the package in other Swift packages due to the `Bundle.module` reference in default parameter values
- Modified the extension methods to accept optional Bundle parameters that internally use `Bundle.module` when nil is provided

## Implementation Details

The following extension methods have been updated:

1. `toLocalizedForPackage(bundle:)`: 
   - Changed parameter from `bundle: Bundle = .module` to `bundle: Bundle? = nil`
   - Added internal handling with `let bundleToUse = bundle ?? Bundle.module`

2. `toLocalizedStringForPackage(bundle:)`:
   - Changed parameter from `bundle: Bundle = .module` to `bundle: Bundle? = nil`
   - Updated to pass the optional bundle to the internal method

## Usage

No changes to your code are required if you're already using these methods without specifying a bundle. If you were explicitly passing `Bundle.module`, your code will continue to work as before.

Example:
```swift
// This will continue to work the same way
let packageMessage = "package_greeting".toLocalizedForPackage()

// This is still supported
let customPackageMessage = "error_message".toLocalizedForPackage(bundle: swift_custom_extensions.Bundle.module)
```

## Compatibility

This release maintains compatibility with:
- Swift 6.0+
- iOS 13.0+
- macOS 10.15+
- watchOS 6.0+
- visionOS 1.0+
