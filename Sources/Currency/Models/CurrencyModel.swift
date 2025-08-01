//
//  CurrencyModel.swift
//
//
//  Created by Athanasios Papazoglou on 1/2/24.
//

import Foundation

/// A struct representing a model for currency information.
///
/// This struct contains details about a specific currency, including its country code, locale,
/// currency symbol, symbol position, decimal format, and decimal notation.
///
/// Example usage:
/// ```swift
/// let currencyInfo = CurrencyModel(
///     countryCode: "USD",
///     locale: "en-US",
///     symbol: "$",
///     symbolPosition: .left,
///     decimalFormat: "%.2f",
///     decimalNotation: "."
/// )
/// ```
public struct CurrencyModel: Codable {
    public let countryCode: String
    public let locale: String
    public let currencySymbol: String
    public let symbolPosition: CurrencySymbolPosition
    public let decimalFormat: String
    public let decimalNotation: CurrencyDecimalNotation
    public let groupingNotation: CurrencyDecimalNotation
    public let hasCurrencySpace: Bool
}
