<p align="center">
  <a href="https://developer.apple.com/swift/"><img src="https://img.shields.io/badge/Swift-5.7-orange.svg?style=flat" alt="Swift 5.7"></a>
  <a href="https://github.com/apple/swift-package-manager"><img src="https://img.shields.io/badge/Swift%20Package%20Manager-compatible-brightgreen.svg" alt="SPM"></a>
</p>

# Currency Swift Package Manager for iOS

This is a Currency module for the native iOS app

## Installation

### Swift Package Manager

To integrate using Apple's [Swift Package Manager](https://swift.org/package-manager/), add the following as a dependency to your `Package.swift`:

```swift
dependencies: [
    .package(url: "https://github.com/tpapazoglou/Products.Novi.iOS.Currency.git", from: "main")
]
```

Alternatively, navigate to your Xcode project, select `Swift Packages`, and click the `+` icon to search for `https://github.com/tpapazoglou/Products.Novi.iOS.Currency.git`.

### Manually

If you prefer not to use any of the aforementioned dependency managers, you can integrate Currency into your project manually. Simply drag the `Sources` Folder into your Xcode project.

## Usage

For each country, a JSON file with the configurations must be created.

Greece ex.
```json
{
    "countryCode": "GR",
    "locale": "el-GR",
    "symbol": "€",
    "symbolPosition": "right",
    "decimalFormat": "%.2f",
    "decimalNotation": ","
}
```
The file must have a specific name, as follows:

```{Country_Code}-{Current_Locale}```

Attention!
The country code must have the [ISO 3166 Alpha-2 format](https://www.iban.com/country-codes)

For ex. for Greece, we have two files for each supported language,
`GR-el-GR` and `GR-en-US`

The init function gets the country code and reads the appropriate file from the bundle.

Then we can use an extension of the `CurrencyRepresentable` protocol and implement the `toCurrency()` function.

For ex. with the usage of the current app session
```swift
func toCurrency() -> String {
    guard let symbol = AccountManager.currency.symbol ?? AccountManager.shared.session?.currencySymbol else { return self }
    let position = AccountManager.currency.symbolPosition ?? .right
    let decimalFormat = AccountManager.currency.decimalFormat ?? "%.2f"
    let decimalNotation = AccountManager.currency.decimalNotation ?? "."
    let amountString = String(format: decimalFormat, self)
    switch position {
    case .left:
        return "\(symbol)\(amountString)".replacingOccurrences(of: ".", with: LocalizedString("decimal.notation"))
        return "\(symbol)\(amountString)".replacingOccurrences(of: ".", with: decimalNotation)
    case .right:
        return "\(amountString)\(symbol)".replacingOccurrences(of: ".", with: LocalizedString("decimal.notation"))
        return "\(amountString)\(symbol)".replacingOccurrences(of: ".", with: decimalNotation)
    }
}
```
