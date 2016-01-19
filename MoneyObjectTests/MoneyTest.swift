import XCTest

@testable
import MoneyObject

class MoneyTest: XCTestCase {
	
	func testCanBeConstructedWithCentsAndCurrency() {
		let money = Money(245, "EUR")
		XCTAssertEqual(money.cents, 245)
		XCTAssertEqual(money.currency, Currency("EUR"))
	}
	
	func testCanBeConstructedWithCentsAndCurrencyIsocode() {
		let money = Money(1000, "EUR")
		XCTAssertEqual(money.cents, 1000)
		XCTAssertEqual(money.currency, Currency("EUR"))
	}
	
	func testIsEqualToMoneyWithSameCentsAndSameCurrency() {
		let money1 = Money(1000, "EUR")
		let money2 = Money(1000, "EUR")
		XCTAssertEqual(money1, money2)
	}

	func testIsNotEqualToMoneyWithDifferentCents() {
		let money1 = Money(1000, "EUR")
		let money2 = Money(100, "EUR")
		XCTAssertNotEqual(money1, money2)
	}
	
	func testIsNotEqualToMoneyWithDifferentCurrency() {
		let money1 = Money(1000, "EUR")
		let money2 = Money(1000, "USD")
		XCTAssertNotEqual(money1, money2)
	}
	
	func testCanBeAddedToMoneyWithSameCurrency() {
		XCTAssertEqual(Money(1000, "EUR") + Money(500, "EUR"), Money(1500, "EUR"))
		XCTAssertEqual(Money(500, "EUR") + Money(1000, "EUR"), Money(1500, "EUR"))
	}

	func testCanBeSubtractedFromMoneyWithSameCurrency() {
		XCTAssertEqual(Money(1000, "EUR") - Money(750, "EUR"), Money(250, "EUR"))
	}
	
	func testReturnsNilIfCurrenciesAreNotEqualOnArithmetics() {
		XCTAssertNil(Money(1000, "EUR") + Money(500, "USD"))
		XCTAssertNil(Money(1000, "EUR") - Money(500, "USD"))
	}
	
	func testCanHandleNegativeCents() {
		XCTAssertEqual(Money(500, "EUR") - Money(1000, "EUR"), Money(-500, "EUR"))
	}

	func testCanBeMultipliedByScalar() {
		XCTAssertEqual(Money(1000, "EUR") * 5, Money(5000, "EUR"))
		XCTAssertEqual(5 * Money(1000, "EUR"), Money(5000, "EUR"))
	}

	func testCanBeDividedByScalar() {
		XCTAssertEqual(Money(1000, "EUR") / 5, Money(200, "EUR"))
	}

	func testCanBeFormattedToString() {
		XCTAssertEqual(Money(500, "EUR").format(), "5.00 EUR")
		XCTAssertEqual(Money(-500, "EUR").format(), "-5.00 EUR")
	}
}
