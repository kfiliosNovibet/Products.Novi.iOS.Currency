//
//  CurrencySymbolPosition.swift
//  
//
//  Created by Athanasios Papazoglou on 1/2/24.
//

import Foundation
 
/// Enum representing the position of the currency symbol in a formatted currency string.
/// 
/// Use this enum to specify whether the currency symbol should appear on the left or right side
/// of the currency value when formatting it as a string.
public enum CurrencySymbolPosition: String, Codable {
    /// Currency symbol appears on the left side of the currency value.
    public case start
    /// Currency symbol appears on the right side of the currency value.
    public case end
}
