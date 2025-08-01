//
//  CurrencyDecimalNotation.swift
//
//
//  Created by Athanasios Papazoglou on 1/2/24.
//

import Foundation

/// Enum representing different decimal notations used in currency values.
///
/// Use this enum to specify the notation style for representing decimals in a formatted currency string.
///
public enum CurrencyDecimalNotation: String, Codable {
    /// Decimal notation using a dot (e.g., "100.00").
    public case dot = "."
    /// Decimal notation using a comma (e.g., "100,00").
    public case comma = ","
}
