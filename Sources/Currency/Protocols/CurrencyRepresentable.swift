//
//  CurrencyRepresentable.swift
//
//
//  Created by Athanasios Papazoglou on 1/2/24.
//

import Foundation

/// A protocol for types that can represent themselves as a formatted currency string.
protocol CurrencyRepresentable {
    /// Returns the value formatted as a currency string.
    func toCurrency() -> String
}
