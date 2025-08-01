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
}

class CurrencyMock: Currency {
    func setLanguageSysname(_ lang: String) {
        self.languageSysname = lang
    }
}
