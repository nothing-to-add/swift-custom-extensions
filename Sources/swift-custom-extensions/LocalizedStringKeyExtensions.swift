//
//  File name: LocalizedStringKeyExtensions.swift
//  Project name: CustomExtensions
//  Workspace name: swift-custom-extensions
//
//  Created by: nothing-to-add on 23/05/2025
//  Using Swift 6.0
//  Copyright (c) 2023 nothing-to-add
//

import SwiftUI

public extension LocalizedStringKey {
    /// Extracts the underlying string key from a LocalizedStringKey.
    ///
    /// This computed property uses Swift's Mirror reflection to access the internal
    /// key value of a LocalizedStringKey, which is not normally accessible through the public API.
    ///
    /// - Returns: The string key used to create the LocalizedStringKey, or an empty string if the key cannot be extracted.
    ///
    /// - Example:
    /// ```swift
    /// let localizedKey = LocalizedStringKey("welcome_message")
    /// let keyString = localizedKey.keyString  // Returns "welcome_message"
    ///
    /// // Useful for debugging or custom localization handling
    /// print("Using localization key: \(localizedKey.keyString)")
    /// ```
    var keyString: String {
        let mirror = Mirror(reflecting: self)
        if let key = mirror.children.first(where: { $0.label == "key" })?.value as? String {
            return key
        }
        return ""
    }
    
    /// Converts a LocalizedStringKey to a localized String with proper handling of line breaks.
    ///
    /// This method extracts the key from the LocalizedStringKey, uses NSLocalizedString
    /// for localization, and properly processes escaped newline characters.
    ///
    /// - Returns: A properly localized string with line breaks converted from escaped newlines (\\n).
    ///
    /// - Example:
    /// ```swift
    /// // In your Localizable.strings file:
    /// // "multiline_text" = "First line\\nSecond line";
    ///
    /// let localizedKey = LocalizedStringKey("multiline_text")
    /// let formattedString = localizedKey.toLocalizedString()
    /// // Returns "First line
    /// // Second line" with an actual line break
    ///
    /// // Use in UIKit components that don't accept LocalizedStringKey
    /// label.text = LocalizedStringKey("greeting").toLocalizedString()
    /// ```
    func toLocalizedString() -> String {
        let key = self.keyString
        // Use NSLocalizedString to get the localized value with the extracted key
        let localizedString = NSLocalizedString(key, comment: "")
        // Replace escaped newlines with actual newlines
        return localizedString.replacingOccurrences(of: "\\n", with: "\n")
    }
}
