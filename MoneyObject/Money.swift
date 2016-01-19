import Foundation

public struct Money: Equatable {
	public var cents: NSDecimalNumber
	public var currency: Currency

	init(_ cents: NSDecimalNumber, _ currency: Currency) {
		self.cents = cents
		self.currency = currency
	}
	
	public init(_ cents: NSDecimalNumber, _ currencyIsoCode: String) {
		self.cents = cents
		self.currency = Currency(currencyIsoCode)
	}
	
	public func format() -> String {
		let amount = cents.decimalNumberByDividingBy(100)
		return String(format: "%1.2f", amount.floatValue) + " " + currency.format()
	}
	
}
