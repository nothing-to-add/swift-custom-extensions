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
    
    /// Creates a color from a hexadecimal value.
    ///
    /// This initializer allows you to create a SwiftUI Color using hexadecimal notation
    /// commonly used in web and graphic design.
    ///
    /// - Parameters:
    ///   - hex: A hexadecimal integer value representing RGB values (e.g., 0xFF0000 for red)
    ///
    /// - Example:
    /// ```swift
    /// // Create a red color
    /// let redColor = Color(hex: 0xFF0000)
    ///
    /// // Using with hex literals
    /// let green = Color(hex: 0x00FF00)
    /// ```
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
