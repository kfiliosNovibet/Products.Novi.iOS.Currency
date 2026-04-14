//
//  CurrencyTests.swift
//
//
//  Created by Athanasios Papazoglou on 1/2/24.
//

import XCTest
@testable import Currency

final class CurrencyTests: XCTestCase {

    // MARK: - Load from JSON

    func testLoadCurrencyWithWrongData() {
        let wrongCurrency = Currency(countryCode: "USD", languageSysname: "en_US")
        XCTAssertNil(wrongCurrency.model, "Currency model should be nil for unsupported country code")
    }

    func testLoadCurrencyDataGreece_Greek() {
        let currency = Currency(countryCode: "GR", languageSysname: "el")
        XCTAssertNotNil(currency.model)
        XCTAssertEqual(currency.model?.currencyCode, "EUR")
        XCTAssertEqual(currency.model?.currencySymbol, "€")
        XCTAssertEqual(currency.model?.decimalNotation, .comma)
        XCTAssertEqual(currency.model?.groupingNotation, .dot)
        XCTAssertEqual(currency.model?.symbolPosition, .end)
        XCTAssertEqual(currency.model?.hasCurrencySpace, true)
        XCTAssertEqual(currency.model?.decimalFormat, "%.2f")
    }

    func testLoadCurrencyDataGreece_English() {
        let currency = Currency(countryCode: "GR", languageSysname: "en")
        XCTAssertNotNil(currency.model)
        XCTAssertEqual(currency.model?.currencyCode, "EUR")
        XCTAssertEqual(currency.model?.currencySymbol, "€")
        XCTAssertEqual(currency.model?.decimalNotation, .dot)
        XCTAssertEqual(currency.model?.groupingNotation, .comma)
        XCTAssertEqual(currency.model?.symbolPosition, .start)
        XCTAssertEqual(currency.model?.hasCurrencySpace, false)
    }

    func testLoadCurrencyDataCyprus_Greek() {
        let currency = Currency(countryCode: "CY", languageSysname: "el")
        XCTAssertNotNil(currency.model)
        XCTAssertEqual(currency.model?.currencyCode, "EUR")
        XCTAssertEqual(currency.model?.currencySymbol, "€")
        XCTAssertEqual(currency.model?.symbolPosition, .end)
        XCTAssertEqual(currency.model?.decimalNotation, .comma)
    }

    func testLoadCurrencyDataCyprus_English() {
        let currency = Currency(countryCode: "CY", languageSysname: "en")
        XCTAssertNotNil(currency.model)
        XCTAssertEqual(currency.model?.currencyCode, "EUR")
        XCTAssertEqual(currency.model?.currencySymbol, "€")
        XCTAssertEqual(currency.model?.symbolPosition, .start)
    }

    func testLoadCurrencyDataIreland() {
        let currency = Currency(countryCode: "IE", languageSysname: "en")
        XCTAssertNotNil(currency.model)
        XCTAssertEqual(currency.model?.currencyCode, "EUR")
        XCTAssertEqual(currency.model?.currencySymbol, "€")
        XCTAssertEqual(currency.model?.symbolPosition, .start)
        XCTAssertEqual(currency.model?.decimalNotation, .dot)
    }

    func testLoadCurrencyDataBrazil_English() {
        let currency = Currency(countryCode: "BR", languageSysname: "en")
        XCTAssertNotNil(currency.model)
        XCTAssertEqual(currency.model?.currencyCode, "BRL")
        XCTAssertEqual(currency.model?.symbolPosition, .end)
        XCTAssertEqual(currency.model?.hasCurrencySpace, true)
    }

    func testLoadCurrencyDataBrazil_Portuguese() {
        let currency = Currency(countryCode: "BR", languageSysname: "pt")
        XCTAssertNotNil(currency.model)
        XCTAssertEqual(currency.model?.currencyCode, "BRL")
        XCTAssertEqual(currency.model?.currencySymbol, "R$")
        XCTAssertEqual(currency.model?.symbolPosition, .start)
        XCTAssertEqual(currency.model?.decimalNotation, .comma)
        XCTAssertEqual(currency.model?.groupingNotation, .dot)
    }

    func testLoadCurrencyDataMexico_English() {
        let currency = Currency(countryCode: "MX", languageSysname: "en")
        XCTAssertNotNil(currency.model)
        XCTAssertEqual(currency.model?.currencyCode, "MXN")
        XCTAssertEqual(currency.model?.currencySymbol, "MX$")
        XCTAssertEqual(currency.model?.symbolPosition, .start)
        XCTAssertEqual(currency.model?.decimalNotation, .dot)
    }

    func testLoadCurrencyDataMexico_Spanish() {
        let currency = Currency(countryCode: "MX", languageSysname: "es")
        XCTAssertNotNil(currency.model)
        XCTAssertEqual(currency.model?.currencyCode, "MXN")
        XCTAssertEqual(currency.model?.currencySymbol, "$")
        XCTAssertEqual(currency.model?.symbolPosition, .start)
    }

    func testLoadCurrencyDataChile_Spanish() {
        let currency = Currency(countryCode: "CL", languageSysname: "es")
        XCTAssertNotNil(currency.model)
        XCTAssertEqual(currency.model?.currencyCode, "CLP")
        XCTAssertEqual(currency.model?.currencySymbol, "$")
        XCTAssertEqual(currency.model?.decimalNotation, .comma)
        XCTAssertEqual(currency.model?.groupingNotation, .dot)
        XCTAssertEqual(currency.model?.symbolPosition, .start)
        XCTAssertEqual(currency.model?.hasCurrencySpace, true)
    }

    func testLoadCurrencyDataChile_English() {
        let currency = Currency(countryCode: "CL", languageSysname: "en")
        XCTAssertNotNil(currency.model)
        XCTAssertEqual(currency.model?.currencyCode, "CLP")
        XCTAssertEqual(currency.model?.currencySymbol, "CLP")
        XCTAssertEqual(currency.model?.decimalNotation, .dot)
        XCTAssertEqual(currency.model?.groupingNotation, .comma)
    }

    func testLoadCurrencyDataEcuador_Spanish() {
        let currency = Currency(countryCode: "EC", languageSysname: "es")
        XCTAssertNotNil(currency.model)
        XCTAssertEqual(currency.model?.currencyCode, "USD")
        XCTAssertEqual(currency.model?.currencySymbol, "$")
        XCTAssertEqual(currency.model?.decimalNotation, .comma)
        XCTAssertEqual(currency.model?.groupingNotation, .dot)
        XCTAssertEqual(currency.model?.symbolPosition, .start)
        XCTAssertEqual(currency.model?.hasCurrencySpace, false)
    }

    func testLoadCurrencyDataEcuador_English() {
        let currency = Currency(countryCode: "EC", languageSysname: "en")
        XCTAssertNotNil(currency.model)
        XCTAssertEqual(currency.model?.currencyCode, "USD")
        XCTAssertEqual(currency.model?.currencySymbol, "$")
        XCTAssertEqual(currency.model?.decimalNotation, .dot)
        XCTAssertEqual(currency.model?.groupingNotation, .comma)
    }

    // MARK: - Init with CurrencyModel

    func testInitWithCurrencyModel() {
        let currencyModel = CurrencyModel(
            countryCode: "GR",
            currencyCode: "EUR",
            locale: "el-GR",
            currencySymbol: "€",
            symbolPosition: .end,
            decimalFormat: "%.2f",
            decimalNotation: .comma,
            groupingNotation: .dot,
            hasCurrencySpace: false
        )
        let currency = Currency(currencyModel: currencyModel)

        XCTAssertNotNil(currency.model)
        XCTAssertEqual(currency.countryCode, "GR")
        XCTAssertEqual(currency.languageSysname, "el-GR")
        XCTAssertEqual(currency.model?.currencyCode, "EUR")
        XCTAssertEqual(currency.model?.currencySymbol, "€")
        XCTAssertEqual(currency.model?.decimalNotation, .comma)
        XCTAssertEqual(currency.model?.groupingNotation, .dot)
        XCTAssertEqual(currency.model?.symbolPosition, .end)
        XCTAssertEqual(currency.model?.decimalFormat, "%.2f")
    }

    func testInitWithCurrencyModelChile() {
        let currencyModel = CurrencyModel(
            countryCode: "CL",
            currencyCode: "CLP",
            locale: "es-CL",
            currencySymbol: "$",
            symbolPosition: .start,
            decimalFormat: "%.2f",
            decimalNotation: .comma,
            groupingNotation: .dot,
            hasCurrencySpace: true
        )
        let currency = Currency(currencyModel: currencyModel)

        XCTAssertNotNil(currency.model)
        XCTAssertEqual(currency.countryCode, "CL")
        XCTAssertEqual(currency.languageSysname, "es-CL")
        XCTAssertEqual(currency.model?.currencyCode, "CLP")
        XCTAssertEqual(currency.model?.currencySymbol, "$")
        XCTAssertEqual(currency.model?.symbolPosition, .start)
        XCTAssertEqual(currency.model?.hasCurrencySpace, true)
    }

    func testInitWithCurrencyModelEcuador() {
        let currencyModel = CurrencyModel(
            countryCode: "EC",
            currencyCode: "USD",
            locale: "es-EC",
            currencySymbol: "$",
            symbolPosition: .start,
            decimalFormat: "%.2f",
            decimalNotation: .comma,
            groupingNotation: .dot,
            hasCurrencySpace: false
        )
        let currency = Currency(currencyModel: currencyModel)

        XCTAssertNotNil(currency.model)
        XCTAssertEqual(currency.countryCode, "EC")
        XCTAssertEqual(currency.languageSysname, "es-EC")
        XCTAssertEqual(currency.model?.currencyCode, "USD")
        XCTAssertEqual(currency.model?.currencySymbol, "$")
        XCTAssertEqual(currency.model?.symbolPosition, .start)
        XCTAssertEqual(currency.model?.hasCurrencySpace, false)
    }

    // MARK: - Refresh

    func testRefresh() {
        let currency = CurrencyMock(countryCode: "GR", languageSysname: "el")
        XCTAssertEqual(currency.model?.decimalNotation, .comma)
        currency.setLanguageSysname("en")
        currency.refresh()
        XCTAssertEqual(currency.model?.decimalNotation, .dot)
    }

    // MARK: - Locale Format

    func testLocaleFormat() {
        let currency = CurrencyMock(countryCode: "GR", languageSysname: "el")
        currency.setLanguageSysname("el-GR")
        let result = currency.localeFormat(amount: 2130.60)
        XCTAssertEqual(result, "2.130,60")
    }

    func testLocaleFormatWithFullLocaleIdentifier() {
        let currency = CurrencyMock(countryCode: "GR", languageSysname: "el")
        currency.setLanguageSysname("el-GR")
        let result = currency.localeFormat(amount: 2130.60)
        XCTAssertEqual(result, "2.130,60")
    }

    func testLocaleFormatEnglish() {
        let currency = CurrencyMock(countryCode: "GR", languageSysname: "en")
        currency.setLanguageSysname("en-GR")
        let result = currency.localeFormat(amount: 2130.60)
        XCTAssertEqual(result, "2,130.60")
    }

    // MARK: - Currency Format

    func testCurrencyFormatGreekSymbolAtEnd() {
        let currency = Currency(countryCode: "GR", languageSysname: "el")
        let result = currency.currencyFormat(amount: 1000.50)
        XCTAssertNotNil(result)
        XCTAssertTrue(result?.contains("€") == true)
        XCTAssertTrue(result?.hasSuffix("€") == true || result?.hasSuffix(" €") == true)
    }

    func testCurrencyFormatEnglishSymbolAtStart() {
        let currency = Currency(countryCode: "GR", languageSysname: "en")
        let result = currency.currencyFormat(amount: 1000.50)
        XCTAssertNotNil(result)
        XCTAssertTrue(result?.hasPrefix("€") == true)
    }

    func testCurrencyFormatBrazilPortuguese() {
        let currency = Currency(countryCode: "BR", languageSysname: "pt")
        let result = currency.currencyFormat(amount: 1234.56)
        XCTAssertNotNil(result)
        XCTAssertTrue(result?.contains("R$") == true)
    }

    // MARK: - Currency Format Without Trailing Zeroes

    func testCurrencyFormatWithoutTrailingZeroes_wholeNumber() {
        let currency = Currency(countryCode: "GR", languageSysname: "en")
        let result = currency.currencyFormatWithoutTrailingZeroes(amount: 100.00)
        XCTAssertNotNil(result)
        XCTAssertFalse(result?.contains(".00") == true)
    }

    func testCurrencyFormatWithoutTrailingZeroes_withDecimals() {
        let currency = Currency(countryCode: "GR", languageSysname: "en")
        let result = currency.currencyFormatWithoutTrailingZeroes(amount: 100.50)
        XCTAssertNotNil(result)
        XCTAssertTrue(result?.contains("100") == true)
    }

    // MARK: - Remove Currency

    func testRemoveCurrencyFromFormattedString() {
        let currency = Currency(countryCode: "GR", languageSysname: "en")
        guard let formatted = currency.currencyFormat(amount: 99.99) else {
            XCTFail("currencyFormat returned nil")
            return
        }
        let stripped = currency.removeCurrency(from: formatted)
        XCTAssertNotNil(stripped)
        XCTAssertFalse(stripped?.contains("€") == true)
    }

    func testRemoveCurrencyInvalidString() {
        let currency = Currency(countryCode: "GR", languageSysname: "en")
        let result = currency.removeCurrency(from: "not a number")
        XCTAssertNil(result)
    }

    // MARK: - currencySymbol convenience getter

    func testCurrencySymbolGetter() {
        let currency = Currency(countryCode: "GR", languageSysname: "el")
        XCTAssertEqual(currency.currencySymbol, "€")
    }

    func testCurrencySymbolGetterNilForInvalidCountry() {
        let currency = Currency(countryCode: "USD", languageSysname: "en_US")
        XCTAssertNil(currency.currencySymbol)
    }
}

class CurrencyMock: Currency {
    func setLanguageSysname(_ lang: String) {
        self.languageSysname = lang
    }
}
