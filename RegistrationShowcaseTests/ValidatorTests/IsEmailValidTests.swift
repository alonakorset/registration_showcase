@testable import RegistrationShowcase
import XCTest

class ValidatorIsEmailValidTests: XCTestCase {
    func testMinimalEmail() throws {
        XCTAssertTrue(Validator.isEmailValid("a@a.aa"))
    }

    func testLongerEmail() throws {
        XCTAssertTrue(Validator.isEmailValid("aaaabbbbb@cdefgh.ch"))
    }

    func testDigitsAllowed() throws {
        XCTAssertTrue(Validator.isEmailValid("12345@12345.ch"))
    }

    func testDotBeforeAt() throws {
        XCTAssertTrue(Validator.isEmailValid("a.b@a.aa"))
    }

    func testMultipleDotsBeforeAt() throws {
        XCTAssertTrue(Validator.isEmailValid("a.b.c@a.aa"))
    }

    func testMultipleAtCharachterNotAllowed() throws {
        XCTAssertFalse(Validator.isEmailValid("a@a@a.aa"))
    }

    func testTwoFollowingDotsAfterAtNotAllowed() throws {
        XCTAssertFalse(Validator.isEmailValid("a.a@a..aa"))
    }

    func testNoDotAfterAtNotAllowed() throws {
        XCTAssertFalse(Validator.isEmailValid("a.a@aa"))
    }
}
