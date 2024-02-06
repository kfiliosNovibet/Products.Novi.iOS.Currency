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
        let currency = Currency(countryCode: "GR", languageSysname: "el-GR")
        let expectation = expectation(description: "Currency data loaded")
        DispatchQueue.main.asyncAfter(deadline: .now() + 1) {
            expectation.fulfill()
        }
        wait(for: [expectation], timeout: 2.0)
        XCTAssertNotNil(currency.model, "Currency model should not be nil after fetching data")
        XCTAssertEqual(currency.model?.symbol, "€")
        XCTAssertEqual(currency.model?.decimalNotation, CurrencyDecimalNotation.comma)
        XCTAssertEqual(currency.model?.symbolPosition, CurrencySymbolPosition.right)
        XCTAssertEqual(currency.model?.decimalFormat, "%.2f")
    }
    
    func testRefresh() {
        let currency = CurrencyMock(countryCode: "GR", languageSysname: "el-GR")
        XCTAssertEqual(currency.model?.decimalNotation, CurrencyDecimalNotation.comma)
        currency.setLanguageSysname("en-US")
        currency.refresh()
        XCTAssertEqual(currency.model?.decimalNotation, CurrencyDecimalNotation.dot)
    }
}

class CurrencyMock: Currency {
    func setLanguageSysname(_ lang: String) {
        self.languageSysname = lang
    }
}
