# Release v1.1.0 - May 26, 2025

## Summary
This release adds new String extensions for package-specific localization, enabling Swift packages to easily provide localized strings from their own resources. The package now properly supports localized resources with improved configuration and documentation.

## What's New
- Added String extension methods for working with package-specific localization:
  - `toLocalizedForPackage()`: Access localized strings from the package's resources
  - `toLocalizedStringForPackage()`: Format localized strings with proper line break handling
- Package now includes configuration for localized resources
- Improved documentation across all String extensions
- Fixed resource handling with proper `defaultLocalization` configuration

## Upgrade Guide
This release is backward compatible with previous versions. To take advantage of the new features:

1. Update your dependency to version 1.1.0
2. If you're developing a Swift package with localized resources, follow the examples in our README to properly configure your Package.swift file

## Examples

```swift
// Access localized strings from the package's resources
let packageMessage = "package_greeting".toLocalizedForPackage()

// Handle multi-line strings with proper line breaks
// Assuming in package's Localizable.strings: "multiline_text" = "First line\\nSecond line";
let formattedText = "multiline_text".toLocalizedStringForPackage()
// Result has actual line breaks instead of escaped sequences
```

## Package Configuration for Localized Resources
```swift
// In Package.swift
let package = Package(
    name: "YourPackageName",
    defaultLocalization: "en",  // Required for localization
    // ...other properties...
    targets: [
        .target(
            name: "YourTarget",
            resources: [.process("Resources")]
        ),
    ]
)
```

## Full Changelog
For a detailed list of all changes in this release, please see the [CHANGELOG.md](CHANGELOG.md) file.
