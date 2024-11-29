//
//  Currency.swift
//
//
//  Created by Athanasios Papazoglou on 1/2/24.
//

import Foundation

/// A final class representing currency information.
///
/// Use this class to encapsulate details about a specific currency, including its country code
/// and language sysname.
open class Currency {
    /// The model containing additional details about the currency, such as locale, symbol, etc.
    private (set) var model: CurrencyModel?
    
    /// The alpha-2 country code for the currency.
    ///
    /// For ex. `GR` or `US`.
    public var countryCode: String
    
    /// The language sysname associated with the currency in the format "languageCode-CountryCode".
    ///
    /// For ex. `el-GR`
    public var languageSysname: String
    
    /// The getter for the currency symbol from the currency model
    public var currencySymbol: String? {
        return model?.currencySymbol
    }
    
    /// Initializes a new instance of the `Currency` class.
    ///
    /// - Parameters:
    ///   - countryCode: The alpha-2 country code for the currency.
    ///   - languageSysname: The language sysname for the currency in the format "languageCode-CountryCode".
    public init(countryCode: String, languageSysname: String) {
        self.countryCode = countryCode
        self.languageSysname = languageSysname
        self.loadCurrencyData()
    }
    
    /// Initializes a new instance of the `Currency` class.
    ///
    /// - Parameters:
    ///   - currencyModel: The already downloaded CurrencyModel.
    ///   - lang: The language sysname for the currency in the format "languageCode-CountryCode".
    public init(currencyModel: CurrencyModel, lang: String) {
        self.countryCode = currencyModel.countryCode
        self.model = currencyModel
        self.languageSysname = String(lang.prefix(2))
    }
    
    
    // MARK: Public Methods
    
    /// Refreshes currency information by fetching data from a JSON file associated with the
    /// country code and language sysname.
    public func refresh() {
        loadCurrencyData()
    }
    
    /// Returns the formatted string for the given double
    ///
    /// - Parameter amount: the amount to format into currency
    public func currencyFormat(amount: Double) -> String? {
        let numberFormatter = NumberFormatter()
        let amountNSNumber = NSNumber(floatLiteral: amount)
        numberFormatter.numberStyle = .currency
        numberFormatter.currencySymbol = model?.currencySymbol
        numberFormatter.currencyDecimalSeparator = model?.decimalNotation.rawValue
        numberFormatter.currencyGroupingSeparator = model?.groupingNotation.rawValue
        numberFormatter.locale = Locale(identifier: languageSysname)
        return numberFormatter.string(from: amountNSNumber)
    }
    
    /// - Parameter string: the amount to format into currency
    public func currencyFormatWithoutTrailingZeroes(amount: Double) -> String? {
        let numberFormatter = NumberFormatter()
        let amountNSNumber = NSNumber(floatLiteral: amount)
        numberFormatter.numberStyle = .currency
        numberFormatter.currencySymbol = model?.currencySymbol
        numberFormatter.currencyDecimalSeparator = model?.decimalNotation.rawValue
        numberFormatter.currencyGroupingSeparator = model?.groupingNotation.rawValue
        numberFormatter.minimumFractionDigits = 0
        numberFormatter.maximumFractionDigits = 2
        numberFormatter.locale = Locale(identifier: languageSysname)
        return numberFormatter.string(from: amountNSNumber)
    }
    
    /// Removes the currency symbol from the given string
    ///
    /// - Parameter string: the string from which to remove the currency symbol
    public func removeCurrency(from string: String) -> String? {
        let numberFormatter = NumberFormatter()
        numberFormatter.numberStyle = .currency
        numberFormatter.currencySymbol = model?.currencySymbol
        numberFormatter.currencyDecimalSeparator = model?.decimalNotation.rawValue
        numberFormatter.currencyGroupingSeparator = model?.groupingNotation.rawValue
        numberFormatter.locale = Locale(identifier: languageSysname)
        guard let number = numberFormatter.number(from: string) else { return nil }
        return "\(number)"
    }
    
    // MARK: Private Methods
    
    /// Fetches currency information from a JSON file located in the main bundle.
    ///
    /// The JSON file should be named "\(countryCode)-\(languageSysname).json".
    ///
    private func loadCurrencyData() {
        guard let fileURL = Bundle.module.url(forResource: "\(countryCode.uppercased())-\(languageSysname.lowercased())", withExtension: "json") else { return }
        guard let jsonData = try? Data(contentsOf: fileURL) else { return }
        let decoder = JSONDecoder()
        let model = try? decoder.decode(CurrencyModel.self, from: jsonData)
        self.model = model
    }
}
