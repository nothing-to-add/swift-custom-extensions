# CustomExtensions

![Swift](https://img.shields.io/badge/Swift-6.0-orange.svg)
![iOS](https://img.shields.io/badge/iOS-13.0%2B-blue.svg)
![macOS](https://img.shields.io/badge/macOS-10.15%2B-blue.svg)
![watchOS](https://img.shields.io/badge/watchOS-6.0%2B-blue.svg)
![visionOS](https://img.shields.io/badge/visionOS-1.0%2B-blue.svg)
![GitHub tag](https://img.shields.io/github/v/tag/nothing-to-add/swift-custom-extensions)
![GitHub stars](https://img.shields.io/github/stars/nothing-to-add/swift-custom-extensions)
![GitHub issues](https://img.shields.io/github/issues/nothing-to-add/swift-custom-extensions)
![GitHub contributors](https://img.shields.io/github/contributors/nothing-to-add/swift-custom-extensions)
![GitHub commit activity](https://img.shields.io/github/commit-activity/m/nothing-to-add/swift-custom-extensions)
![GitHub top language](https://img.shields.io/github/languages/top/nothing-to-add/swift-custom-extensions)
![License](https://img.shields.io/github/license/nothing-to-add/swift-custom-extensions)

A collection of useful Swift extensions for SwiftUI and Foundation types that enhance functionality and improve developer experience.

## Features

This package includes extensions for:

### String Extensions

- **`localized()`** - Converts a String to a `LocalizedStringKey` for easy use with SwiftUI localization
- **`localizedNS(withComment:)`** - Returns a localized version of the string using `NSLocalizedString`

### Color Extensions

- **`Color(hex: UInt, alpha:)`** - Creates a SwiftUI Color from a hexadecimal integer value (0xRRGGBB format) with optional opacity
- **`Color(hex: String)`** - Creates a SwiftUI Color from a hexadecimal string (supports formats: RGB, RRGGBB, AARRGGBB, with or without # prefix)
- **`Color.isDarkMode`** - Static property to check if the current system appearance is in dark mode (iOS/tvOS only)

### LocalizedStringKey Extensions

- **`keyString`** - Extracts the underlying string key from a LocalizedStringKey using reflection
- **`toLocalizedString()`** - Converts a LocalizedStringKey to a properly localized String with line break handling

## Requirements

- Swift 6.0+
- iOS 13.0+
- macOS 10.15+
- watchOS 6.0+
- visionOS 1.0+

## Installation

### Swift Package Manager

Add the following dependency to your `Package.swift` file:

```swift
dependencies: [
    .package(url: "https://github.com/nothing-to-add/swift-custom-extensions.git", from: "1.0.0")
]
```

Or add it directly through Xcode:
1. Go to `File` > `Add Packages...`
2. Enter the repository URL: `https://github.com/nothing-to-add/swift-custom-extensions.git`
3. Follow the prompts to add the package to your project

## Usage

### String Extensions

```swift
import CustomExtensions

// SwiftUI localization
Text("hello_world".localized())  // Uses LocalizedStringKey for SwiftUI

// Foundation localization
let message = "greeting".localizedNS(withComment: "Shown on welcome screen")
```

### Color Extensions

```swift
import CustomExtensions

// Create color from hex integer value
let primaryColor = Color(hex: 0x3498DB)        // Fully opaque color
let translucentPurple = Color(hex: 0x9B59B6, alpha: 0.5)  // 50% opacity

// Create color from hex string
let redColor = Color(hex: "FF0000")       // RGB (24-bit)
let blueColor = Color(hex: "#00F")        // RGB (12-bit shorthand) with # prefix
let greenWithAlpha = Color(hex: "80FF00FF") // ARGB (32-bit with alpha - 50% opaque)

// Check for dark mode (iOS/tvOS only)
if Color.isDarkMode {
    // Use dark mode specific styling
}
```

### LocalizedStringKey Extensions

```swift
import CustomExtensions

// Extract the key from a LocalizedStringKey
let localizedKey = LocalizedStringKey("welcome_message")
let keyValue = localizedKey.keyString // Returns "welcome_message"

// Convert LocalizedStringKey to String with proper line break handling
// Assuming in Localizable.strings: "multiline_text" = "First line\\nSecond line";
let localizedString = LocalizedStringKey("multiline_text").toLocalizedString()
// Result: "First line
//          Second line" with an actual line break

// Use in UIKit components that don't support LocalizedStringKey
label.text = LocalizedStringKey("button_title").toLocalizedString()

// Useful for debugging localization issues
print("Using key: \(localizedKey.keyString), localized as: \(localizedKey.toLocalizedString())")
```

## License

This project is available under the [LICENSE](LICENSE) license. See the LICENSE file for more info.

## Contributing

Contributions are welcome! Please feel free to submit a Pull Request.

1. Fork the project
2. Create your feature branch (`git checkout -b feature/amazing-feature`)
3. Commit your changes (`git commit -m 'Add some amazing feature'`)
4. Push to the branch (`git push origin feature/amazing-feature`)
5. Open a Pull Request
