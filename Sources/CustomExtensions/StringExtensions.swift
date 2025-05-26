//
//  File name: StringExtensions.swift
//  Project name: CustomExtensions
//  Workspace name: swift-custom-extensions
//
//  Created by: nothing-to-add on 21/05/2025
//  Using Swift 6.0
//  Copyright (c) 2023 nothing-to-add
//

import Foundation
import SwiftUICore
import SwiftUI

public extension String {
    
    /// Converts a String to a LocalizedStringKey for use with SwiftUI localization.
    ///
    /// This method simplifies the creation of localized text in SwiftUI views by
    /// converting a String to a LocalizedStringKey, which SwiftUI uses for localization.
    ///
    /// - Returns: A LocalizedStringKey created from this string.
    ///
    /// - Example:
    /// ```swift
    /// // In a SwiftUI view:
    /// Text("hello_world".localized())  // Will use the localized value of "hello_world" key
    ///
    /// // Instead of:
    /// Text(LocalizedStringKey("hello_world"))
    ///
    /// // Can be used with string interpolation in SwiftUI
    /// Text("welcome_user \(username)".localized())
    /// ```
    func localized() -> LocalizedStringKey {
        LocalizedStringKey(self)
    }
}

public extension String {
    
    /// Returns a localized version of the string using NSLocalizedString.
    ///
    /// This method provides a convenient way to access NSLocalizedString functionality
    /// with an optional comment parameter.
    ///
    /// - Parameter comment: An optional comment to help translators understand the context.
    /// - Returns: The localized string.
    ///
    /// - Example:
    /// ```swift
    /// // Basic usage:
    /// let message = "hello_world".localizedNS()
    ///
    /// // With a comment for translators:
    /// let greeting = "welcome_message".localizedNS(withComment: "Shown on the welcome screen")
    ///
    /// // In UIKit components:
    /// label.text = "button_title".localizedNS()
    /// ```
    func localizedNS(withComment comment: String? = nil) -> String {
        return NSLocalizedString(self, comment: comment ?? "")
    }
    
}

public extension String {
    
    /// Returns a localized version of the string for a Swift package.
    ///
    /// This method provides localization specifically for strings within a Swift package.
    /// By default, it uses the current module's bundle (Bundle.module), but you can also specify
    /// a custom bundle to use the localization from a different package.
    ///
    /// - Parameter bundle: The bundle to use for localization. Default is Bundle.module.
    /// - Returns: The localized string from the specified bundle's resources.
    ///
    /// - Note: This requires the package to have resources defined in Package.swift with
    ///   the resources parameter and a defaultLocalization set.
    ///
    /// - Example:
    /// ```swift
    /// // Access localized strings from this package's resources
    /// let thisPackageMessage = "package_greeting".toLocalizedForPackage()
    ///
    /// // Access localized strings from a specific bundle
    /// import swift_custom_extensions
    /// let customExtensionsMessage = "error_message".toLocalizedForPackage(bundle: swift_custom_extensions.Bundle.module)
    /// ```
    func toLocalizedForPackage(bundle: Bundle = .module) -> String {
        NSLocalizedString(self, bundle: bundle, comment: "")
    }
}

public extension String {
    
    /// Converts a localized package string to a properly formatted string with actual line breaks.
    ///
    /// This method is useful when dealing with localized strings that contain escaped newline characters (\\n),
    /// as it automatically converts them to actual line breaks in the resulting string.
    ///
    /// - Parameter bundle: The bundle to use for localization. Default is Bundle.module.
    /// - Returns: A properly formatted string with actual line breaks instead of escaped sequences.
    ///
    /// - Example:
    /// ```swift
    /// // Assuming in package's Localizable.strings: "multiline_text" = "First line\\nSecond line";
    /// let formattedText = "multiline_text".toLocalizedStringForPackage()
    /// // Result: "First line
    /// //          Second line" with an actual line break
    /// 
    /// // Using a specific bundle
    /// import swift_custom_extensions
    /// let customText = "multiline_warning".toLocalizedStringForPackage(bundle: swift_custom_extensions.Bundle.module)
    /// ```
    func toLocalizedStringForPackage(bundle: Bundle = .module) -> String {
        self.toLocalizedForPackage(bundle: bundle).replacingOccurrences(of: "\\n", with: "\n")
    }
}
