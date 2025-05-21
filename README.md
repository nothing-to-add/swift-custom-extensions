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

- **`Color(hex:alpha:)`** - Creates a SwiftUI Color from a hexadecimal value
- **`Color.isDarkMode`** - Static property to check if the current system appearance is in dark mode (iOS/tvOS only)

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

// Create color from hex value
let primaryColor = Color(hex: 0x3498DB)
let secondaryColor = Color(hex: 0x2ECC71, alpha: 0.8)

// Check for dark mode (iOS/tvOS only)
if Color.isDarkMode {
    // Use dark mode specific styling
}
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
