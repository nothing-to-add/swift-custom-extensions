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
