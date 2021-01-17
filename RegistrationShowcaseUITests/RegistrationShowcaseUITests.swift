import XCTest

class RegistrationShowcaseUITests: XCTestCase {
    func testExample() throws {
        let app = XCUIApplication()
        app.launch()
        
        let textField = app.textFields.element(boundBy: 0)
        textField.tap()
        textField.typeText("My Name")
        
        let textField2 = app.textFields.element(boundBy: 1)
        textField2.tap()
        textField2.typeText("a@example.com")
        
        app.datePickers.element.tap()
        app.buttons["Show year picker"].tap()
                
        app.datePickers.datePickers.pickerWheels["2021"].press(forDuration: 0.5)
        app.datePickers.datePickers.pickerWheels["2021"].swipeDown()
        app.buttons["Hide year picker"].tap()
        app.tapCoordinate(at: CGPoint(x: 30, y: 30))
           
        app.buttons["Register"].tap()
        
        sleep(1)
        
        XCTAssertTrue(app.staticTexts["My Name"].exists)
        XCTAssertTrue(app.staticTexts["a@example.com"].exists)
    }
}
