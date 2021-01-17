@testable import RegistrationShowcase
import XCTest

class ValidatorIsNameValidTests: XCTestCase {
    func testMinimalName() throws {
        XCTAssertTrue(Validator.isNameValid("a"))
    }

    func testLongerName() throws {
        XCTAssertTrue(Validator.isNameValid("some name"))
    }

    func testNoCharacters() throws {
        XCTAssertFalse(Validator.isNameValid(""))
    }

    func testWhitespaceOnly() throws {
        XCTAssertFalse(Validator.isNameValid(" "))
    }
}
