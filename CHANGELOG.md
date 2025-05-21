# Changelog

All notable changes to this project will be documented in this file.

The format is based on [Keep a Changelog](https://keepachangelog.com/en/1.0.0/),
and this project adheres to [Semantic Versioning](https://semver.org/spec/v2.0.0.html).

## [Unreleased]

### Added
- Initial development setup

## [1.0.1] - 2025-05-21

### Improved
- Enhanced documentation for `Color(hex: String)` extension with more examples and clear format explanation
- Added support for hex strings with # prefix
- Improved documentation for `Color(hex: UInt, alpha:)` extension with detailed examples and parameter explanations

## [1.0.0] - 2025-05-21

### Added
- Initial release
- String extensions:
  - `localized()`: Converts a String to a LocalizedStringKey for SwiftUI
  - `localizedNS(withComment:)`: Returns a localized version of the string using NSLocalizedString
- Color extensions:
  - `Color(hex:alpha:)`: Creates a SwiftUI Color from a hexadecimal value
  - `Color.isDarkMode`: Static property to check if the current system appearance is in dark mode (iOS/tvOS only)

[Unreleased]: https://github.com/nothing-to-add/swift-custom-extensions/compare/v1.0.1...HEAD
[1.0.1]: https://github.com/nothing-to-add/swift-custom-extensions/compare/v1.0.0...v1.0.1
[1.0.0]: https://github.com/nothing-to-add/swift-custom-extensions/releases/tag/v1.0.0
