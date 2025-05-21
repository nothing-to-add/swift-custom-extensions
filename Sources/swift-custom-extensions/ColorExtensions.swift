//
//  File name: ColorExtensions.swift
//  Project name: CustomExtensions
//  Workspace name: swift-custom-extensions
//
//  Created by: nothing-to-add on 21/05/2025
//  Using Swift 6.0
//  Copyright (c) 2023 nothing-to-add
//

import Foundation
import SwiftUI

public extension Color {
    
    /// Creates a color from a hexadecimal value with an optional alpha component.
    ///
    /// This initializer allows you to create a SwiftUI Color using hexadecimal notation
    /// commonly used in web and graphic design.
    ///
    /// - Parameters:
    ///   - hex: A hexadecimal integer value representing RGB values (e.g., 0xFF0000 for red)
    ///   - alpha: An optional alpha value between 0 and 1 (default is 1)
    ///
    /// - Example:
    /// ```swift
    /// // Create a red color
    /// let redColor = Color(hex: 0xFF0000)
    ///
    /// // Create a blue color with 50% opacity
    /// let blueWithOpacity = Color(hex: 0x0000FF, alpha: 0.5)
    ///
    /// // Using with hex literals
    /// let green = Color(hex: 0x00FF00)
    /// ```
    init(hex: UInt, alpha: Double = 1) {
        self.init(
            .sRGB,
            red: Double((hex >> 16) & 0xff) / 255,
            green: Double((hex >> 8) & 0xff) / 255,
            blue: Double(hex & 0xff) / 255,
            opacity: alpha
        )
    }
}

public extension Color {
    
    /// Determines if the current system appearance is in dark mode
    ///
    /// This property is only available on iOS and tvOS platforms
    /// where UIKit's UITraitCollection is available.
    ///
    /// - Returns: A Boolean value indicating whether dark mode is enabled
    ///
    /// - Note: This property is not available on macOS, watchOS, or visionOS.
    ///
    /// - Example:
    /// ```swift
    /// if Color.isDarkMode {
    ///     // Use dark mode colors
    /// } else {
    ///     // Use light mode colors
    /// }
    /// ```
    @available(iOS, introduced: 13.0)
    @available(tvOS, introduced: 13.0)
    @available(watchOS, unavailable, message: "This functionality is not available on watchOS")
    @available(macOS, unavailable, message: "This functionality is not available on macOS")
    @available(visionOS, unavailable, message: "This functionality is not available on visionOS")
    static var isDarkMode: Bool {
        #if os(iOS) || os(tvOS)
        return UITraitCollection.current.userInterfaceStyle == .dark
        #else
        return false
        #endif
    }
}
