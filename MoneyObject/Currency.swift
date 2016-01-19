import Foundation

public struct Currency: Equatable {
	public var isoCode: String
	
	public init(_ isoCode: String) {
		self.isoCode = isoCode
	}
	
	public func format() -> String {
		return isoCode
	}
}

public func == (lhs: Currency, rhs: Currency) -> Bool {
	return lhs.isoCode == rhs.isoCode
}