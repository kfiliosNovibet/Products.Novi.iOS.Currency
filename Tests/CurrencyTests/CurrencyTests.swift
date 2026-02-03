//
//  CurrencyTests.swift
//
//
//  Created by Athanasios Papazoglou on 1/2/24.
//

import XCTest
@testable import Currency

final class CurrencyTests: XCTestCase {
    
    func testLoadCurrencyWithWrongData() {
        let wrongCurrency = Currency(countryCode: "USD", languageSysname: "en_US")
        XCTAssertNil(wrongCurrency.model, "Currency model should not be nil after fetching data")
    }
    
    func testLoadCurrencyData() {
        let currency = Currency(countryCode: "GR", languageSysname: "el")
        let expectation = expectation(description: "Currency data loaded")
        DispatchQueue.main.asyncAfter(deadline: .now() + 1) {
            expectation.fulfill()
        }
        wait(for: [expectation], timeout: 2.0)
        XCTAssertNotNil(currency.model, "Currency model should not be nil after fetching data")
        XCTAssertEqual(currency.model?.currencySymbol, "€")
        XCTAssertEqual(currency.model?.decimalNotation, CurrencyDecimalNotation.comma)
        XCTAssertEqual(currency.model?.symbolPosition, CurrencySymbolPosition.end)
        XCTAssertEqual(currency.model?.decimalFormat, "%.2f")
    }
    
    func testRefresh() {
        let currency = CurrencyMock(countryCode: "GR", languageSysname: "el")
        XCTAssertEqual(currency.model?.decimalNotation, CurrencyDecimalNotation.comma)
        currency.setLanguageSysname("en")
        currency.refresh()
        XCTAssertEqual(currency.model?.decimalNotation, CurrencyDecimalNotation.dot)
    }

    func testLocaleFormat() {
        let currency = CurrencyMock(countryCode: "GR", languageSysname: "el")
        XCTAssertEqual(currency.model?.decimalNotation, CurrencyDecimalNotation.comma)
        currency.setLanguageSysname("el-GR")
        let localeFormat = currency.localeFormat(amount: 2130.60)
        XCTAssertEqual(localeFormat, "2.130,60")
    }

    func testLoadCurrencyDataChile() {
        let currency = Currency(countryCode: "CL", languageSysname: "es")
        let expectation = expectation(description: "Currency data loaded for Chile")
        DispatchQueue.main.asyncAfter(deadline: .now() + 1) {
            expectation.fulfill()
        }
        wait(for: [expectation], timeout: 2.0)
        XCTAssertNotNil(currency.model, "Currency model should not be nil after fetching data")
        XCTAssertEqual(currency.model?.currencySymbol, "$")
        XCTAssertEqual(currency.model?.decimalNotation, CurrencyDecimalNotation.comma)
        XCTAssertEqual(currency.model?.groupingNotation, CurrencyDecimalNotation.dot)
        XCTAssertEqual(currency.model?.symbolPosition, CurrencySymbolPosition.start)
        XCTAssertEqual(currency.model?.decimalFormat, "%.2f")
    }

    func testLoadCurrencyDataEcuador() {
        let currency = Currency(countryCode: "EC", languageSysname: "es")
        let expectation = expectation(description: "Currency data loaded for Ecuador")
        DispatchQueue.main.asyncAfter(deadline: .now() + 1) {
            expectation.fulfill()
        }
        wait(for: [expectation], timeout: 2.0)
        XCTAssertNotNil(currency.model, "Currency model should not be nil after fetching data")
        XCTAssertEqual(currency.model?.currencySymbol, "$")
        XCTAssertEqual(currency.model?.decimalNotation, CurrencyDecimalNotation.comma)
        XCTAssertEqual(currency.model?.groupingNotation, CurrencyDecimalNotation.dot)
        XCTAssertEqual(currency.model?.symbolPosition, CurrencySymbolPosition.start)
        XCTAssertEqual(currency.model?.decimalFormat, "%.2f")
    }

    func testLocaleFormatWithFullLocaleIdentifier() {
        let currency = CurrencyMock(countryCode: "GR", languageSysname: "el")
        XCTAssertEqual(currency.model?.decimalNotation, CurrencyDecimalNotation.comma)
        currency.setLanguageSysname("el-GR")
        let localeFormat = currency.localeFormat(amount: 2130.60)
        XCTAssertEqual(localeFormat, "2.130,60")
    }

    func testInitWithCurrencyModel() {
        let currencyModel = CurrencyModel(
            countryCode: "GR",
            locale: "el-GR",
            currencySymbol: "€",
            symbolPosition: .end,
            decimalFormat: "%.2f",
            decimalNotation: .comma,
            groupingNotation: .dot,
            hasCurrencySpace: false
        )
        let currency = Currency(currencyModel: currencyModel)

        XCTAssertNotNil(currency.model, "Currency model should not be nil")
        XCTAssertEqual(currency.countryCode, "GR")
        XCTAssertEqual(currency.languageSysname, "el-GR")
        XCTAssertEqual(currency.model?.currencySymbol, "€")
        XCTAssertEqual(currency.model?.decimalNotation, CurrencyDecimalNotation.comma)
        XCTAssertEqual(currency.model?.groupingNotation, CurrencyDecimalNotation.dot)
        XCTAssertEqual(currency.model?.symbolPosition, CurrencySymbolPosition.end)
        XCTAssertEqual(currency.model?.decimalFormat, "%.2f")
    }

    func testInitWithCurrencyModelChile() {
        let currencyModel = CurrencyModel(
            countryCode: "CL",
            locale: "es-CL",
            currencySymbol: "$",
            symbolPosition: .start,
            decimalFormat: "%.2f",
            decimalNotation: .comma,
            groupingNotation: .dot,
            hasCurrencySpace: true
        )
        let currency = Currency(currencyModel: currencyModel)

        XCTAssertNotNil(currency.model, "Currency model should not be nil")
        XCTAssertEqual(currency.countryCode, "CL")
        XCTAssertEqual(currency.languageSysname, "es-CL")
        XCTAssertEqual(currency.model?.currencySymbol, "$")
        XCTAssertEqual(currency.model?.symbolPosition, CurrencySymbolPosition.start)
        XCTAssertEqual(currency.model?.hasCurrencySpace, true)
    }

    func testInitWithCurrencyModelEcuador() {
        let currencyModel = CurrencyModel(
            countryCode: "EC",
            locale: "es-EC",
            currencySymbol: "$",
            symbolPosition: .start,
            decimalFormat: "%.2f",
            decimalNotation: .comma,
            groupingNotation: .dot,
            hasCurrencySpace: false
        )
        let currency = Currency(currencyModel: currencyModel)

        XCTAssertNotNil(currency.model, "Currency model should not be nil")
        XCTAssertEqual(currency.countryCode, "EC")
        XCTAssertEqual(currency.languageSysname, "es-EC")
        XCTAssertEqual(currency.model?.currencySymbol, "$")
        XCTAssertEqual(currency.model?.symbolPosition, CurrencySymbolPosition.start)
        XCTAssertEqual(currency.model?.hasCurrencySpace, false)
    }
}

class CurrencyMock: Currency {
    func setLanguageSysname(_ lang: String) {
        self.languageSysname = lang
    }
}
