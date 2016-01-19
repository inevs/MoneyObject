import Foundation

struct Money: Equatable {
	var cents: NSDecimalNumber
	var currency: Currency

	init(_ cents: NSDecimalNumber, _ currency: Currency) {
		self.cents = cents
		self.currency = currency
	}
	
	init(_ cents: NSDecimalNumber, _ currencyIsoCode: String) {
		self.cents = cents
		self.currency = Currency(currencyIsoCode)
	}
	
	func format() -> String {
		let amount = cents.decimalNumberByDividingBy(100)
		return String(format: "%1.2f", amount.floatValue) + " " + currency.format()
	}
	
}

func == (left: Money, right: Money) -> Bool {
	return left.cents == right.cents && left.currency == right.currency
}

func + (left: Money, right: Money) -> Money? {
	if left.currency != right.currency {
		return nil
	}

	let cents = left.cents.decimalNumberByAdding(right.cents)
	return Money(cents, left.currency)
}

func - (left: Money, right: Money) -> Money? {
	if left.currency != right.currency {
		return nil
	}
	
	let cents = left.cents.decimalNumberBySubtracting(right.cents)
	return Money(cents, left.currency)
}

func * (left: Money, right: NSDecimalNumber) -> Money {
	let cents = left.cents.decimalNumberByMultiplyingBy(right)
	return Money(cents, left.currency)
}

func * (left: NSDecimalNumber, right: Money) -> Money {
	let cents = right.cents.decimalNumberByMultiplyingBy(left)
	return Money(cents, right.currency)
}

func / (left: Money, right: NSDecimalNumber) -> Money {
	let cents = left.cents.decimalNumberByDividingBy(right)
	return Money(cents, left.currency)
}
