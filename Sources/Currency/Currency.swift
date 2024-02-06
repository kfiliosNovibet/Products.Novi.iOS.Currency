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
    
    /// Initializes a new instance of the `Currency` class.
    ///
    /// - Parameters:
    ///   - countryCode: The alpha-2 country code for the currency.
    ///   - languageSysname: The language sysname for the currency in the format "languageCode-CountryCode".
    init(countryCode: String, languageSysname: String) {
        self.countryCode = countryCode
        self.languageSysname = languageSysname
        self.loadCurrencyData()
    }
    
    // MARK: Public Methods
    
    /// Refreshes currency information by fetching data from a JSON file associated with the
    /// country code and language sysname.
    public func refresh() {
        loadCurrencyData()
    }
    
    // MARK: Private Methods
    
    /// Fetches currency information from a JSON file located in the main bundle.
    ///
    /// The JSON file should be named "\(countryCode)-\(languageSysname).json".
    ///
    private func loadCurrencyData() {
        guard let fileURL = Bundle.module.url(forResource: "\(countryCode)-\(languageSysname)", withExtension: "json") else { return }
        guard let jsonData = try? Data(contentsOf: fileURL) else { return }
        let decoder = JSONDecoder()
        let model = try? decoder.decode(CurrencyModel.self, from: jsonData)
        self.model = model
    }
}
