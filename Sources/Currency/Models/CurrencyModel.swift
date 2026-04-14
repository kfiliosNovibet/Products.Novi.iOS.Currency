//
//  CurrencyModel.swift
//
//
//  Created by Athanasios Papazoglou on 1/2/24.
//

import Foundation

/// A struct representing a model for currency information.
///
/// This struct contains details about a specific currency, including its country code, currency code,
/// locale, symbol, symbol position, decimal format, decimal notation, grouping notation, and spacing.
///
/// Example usage:
/// ```swift
/// let currencyInfo = CurrencyModel(
///     countryCode: "GR",
///     currencyCode: "EUR",
///     locale: "el-GR",
///     currencySymbol: "€",
///     symbolPosition: .end,
///     decimalFormat: "%.2f",
///     decimalNotation: .comma,
///     groupingNotation: .dot,
///     hasCurrencySpace: true
/// )
/// ```
public struct CurrencyModel: Codable {
    /// The alpha-2 country code (e.g., `GR`, `US`).
    public let countryCode: String

    /// The ISO 4217 currency code (e.g., `EUR`, `USD`).
    public let currencyCode: String

    /// The locale identifier in "languageCode-CountryCode" format (e.g., `el-GR`, `en-US`).
    public let locale: String

    /// The currency symbol to display (e.g., `€`, `$`).
    public let currencySymbol: String

    /// The position of the currency symbol relative to the amount — either `.start` or `.end`.
    public let symbolPosition: CurrencySymbolPosition

    /// The format string used to represent decimal values (e.g., `"%.2f"`).
    public let decimalFormat: String

    /// The character used as the decimal separator (e.g., `.dot` for `"100.00"`, `.comma` for `"100,00"`).
    public let decimalNotation: CurrencyDecimalNotation

    /// The character used as the thousands grouping separator (e.g., `.dot` for `"1.000"`, `.comma` for `"1,000"`).
    public let groupingNotation: CurrencyDecimalNotation

    /// Whether a space should be inserted between the currency symbol and the amount.
    public let hasCurrencySpace: Bool
}
