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
    
    /// Creates a color from a hexadecimal string.
    ///
    /// This initializer allows you to create a SwiftUI Color using hexadecimal string notation
    /// commonly used in web development and design. It supports multiple formats:
    ///
    /// - Parameters:
    ///   - hex: A string containing hexadecimal color representation (with or without # prefix)
    ///          Supported formats:
    ///          - RGB: 3 characters (e.g., "F00" for red)
    ///          - RRGGBB: 6 characters (e.g., "FF0000" for red)
    ///          - AARRGGBB: 8 characters (e.g., "FFFF0000" for fully opaque red)
    ///
    /// - Example:
    /// ```swift
    /// // Create colors from hex strings
    /// let red = Color(hex: "FF0000")     // 6-digit RGB format
    /// let blue = Color(hex: "#0000FF")   // With # prefix
    /// let green = Color(hex: "0F0")      // 3-digit RGB shorthand format
    /// let translucentYellow = Color(hex: "80FFFF00") // With alpha (50% opaque yellow)
    /// ```
    ///
    /// - Note: Invalid hex strings will result in a white or clear color depending on the format.
    init(hex: String) {
        let hex = hex.trimmingCharacters(in: CharacterSet.alphanumerics.inverted)
        var int: UInt64 = 0
        Scanner(string: hex).scanHexInt64(&int)
        let a, r, g, b: UInt64
        switch hex.count {
        case 3: // RGB (12-bit)
            (a, r, g, b) = (255, (int >> 8) * 17, (int >> 4 & 0xF) * 17, (int & 0xF) * 17)
        case 6: // RGB (24-bit)
            (a, r, g, b) = (255, int >> 16, int >> 8 & 0xFF, int & 0xFF)
        case 8: // ARGB (32-bit)
            (a, r, g, b) = (int >> 24, int >> 16 & 0xFF, int >> 8 & 0xFF, int & 0xFF)
        default:
            (a, r, g, b) = (1, 1, 1, 0)
        }

        self.init(
            .sRGB,
            red: Double(r) / 255,
            green: Double(g) / 255,
            blue:  Double(b) / 255,
            opacity: Double(a) / 255
        )
    }
}

public extension Color {
    
    /// Creates a color from a hexadecimal integer value with an optional alpha component.
    ///
    /// This initializer allows you to create a SwiftUI Color using hexadecimal integer notation
    /// commonly used in programmatic color definitions.
    ///
    /// - Parameters:
    ///   - hex: A hexadecimal integer value representing RGB values (e.g., 0xFF0000 for red)
    ///   - alpha: An optional alpha value between 0 and 1 (default is 1, fully opaque)
    ///
    /// - Example:
    /// ```swift
    /// // Create a fully opaque red color
    /// let red = Color(hex: 0xFF0000)
    ///
    /// // Create a blue color with 50% opacity
    /// let translucentBlue = Color(hex: 0x0000FF, alpha: 0.5)
    ///
    /// // Using Swift hex literals
    /// let green = Color(hex: 0x00FF00)
    ///
    /// // Using computed values
    /// let colorValue = 0xFF + (0x00 << 8) + (0xAA << 16)
    /// let customColor = Color(hex: UInt(colorValue))
    /// ```
    ///
    /// - Note: The hex value should be in RGB format (0xRRGGBB).
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
