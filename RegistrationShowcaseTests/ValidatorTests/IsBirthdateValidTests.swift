@testable import RegistrationShowcase
import XCTest

class IsBirthdateValidTests: XCTestCase {
    private let dateFormatter: DateFormatter = {
        let dateFormatter = DateFormatter()
        dateFormatter.dateFormat = "dd/MM/yyyy"
        return dateFormatter
    }()
    
    private func dateFromString(_ dateString: String, file: StaticString = #filePath, line: UInt = #line) -> Date {
        guard let date = dateFormatter.date(from: dateString) else {
            XCTFail(file: file, line: line)
            return Date()
        }
        return date
    }

    func testDateInnerAllowedRange() throws {
        let date = dateFromString("13/08/1955")
        XCTAssertTrue(Validator.isBirthdateValid(date))
    }
    
    func testMinDate() throws {
        let date = dateFromString("01/01/1900")
        XCTAssertTrue(Validator.isBirthdateValid(date))
    }
    
    func testMaxDate() throws {
        let date = dateFromString("31/12/2019")
        XCTAssertTrue(Validator.isBirthdateValid(date))
    }
    
    func testDateBeforeAllowedMinDateFailed() throws {
        let date = dateFromString("13/08/1855")
        XCTAssertFalse(Validator.isBirthdateValid(date))
    }
    
    func testDateAfterAllowedMaxDateFailed() throws {
        let date = dateFromString("01/08/2020")
        XCTAssertFalse(Validator.isBirthdateValid(date))
    }
}
