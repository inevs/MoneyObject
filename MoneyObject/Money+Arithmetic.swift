import Foundation

extension Money {	
}


public func == (left: Money, right: Money) -> Bool {
	return left.cents == right.cents && left.currency == right.currency
}

public func + (left: Money, right: Money) -> Money? {
	if left.currency != right.currency {
		return nil
	}
	
	let cents = left.cents.decimalNumberByAdding(right.cents)
	return Money(cents, left.currency)
}

public func - (left: Money, right: Money) -> Money? {
	if left.currency != right.currency {
		return nil
	}
	
	let cents = left.cents.decimalNumberBySubtracting(right.cents)
	return Money(cents, left.currency)
}

public func * (left: Money, right: NSDecimalNumber) -> Money {
	let cents = left.cents.decimalNumberByMultiplyingBy(right)
	return Money(cents, left.currency)
}

public func * (left: NSDecimalNumber, right: Money) -> Money {
	let cents = right.cents.decimalNumberByMultiplyingBy(left)
	return Money(cents, right.currency)
}

func / (left: Money, right: NSDecimalNumber) -> Money {
	let cents = left.cents.decimalNumberByDividingBy(right)
	return Money(cents, left.currency)
}
