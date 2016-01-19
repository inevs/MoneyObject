import Foundation

struct Currency: Equatable {
	var isoCode: String
	
	init(_ isoCode: String) {
		self.isoCode = isoCode
	}
	
	func format() -> String {
		return isoCode
	}
}

func == (lhs: Currency, rhs: Currency) -> Bool {
	return lhs.isoCode == rhs.isoCode
}