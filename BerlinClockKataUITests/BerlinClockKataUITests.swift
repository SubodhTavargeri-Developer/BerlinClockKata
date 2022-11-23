import XCTest

class BerlinClockKataUITests: XCTestCase {
    
    func test_WhenDigitalTimeIsSixSevenSeventeen_SixHourSevenMinuteSeventeenSecIsSelectedFromPicker() {
        
        let app = XCUIApplication()
        XCUIApplication().activate()
        
        let textField = app.textFields["digitalTime_textField"]
        textField.tap()
        
        app.pickerWheels.element(boundBy: 0).adjust(toPickerWheelValue: "6 Hour")
        app.pickerWheels.element(boundBy: 1).adjust(toPickerWheelValue: "7 Minute")
        app.pickerWheels.element(boundBy: 2).adjust(toPickerWheelValue: "17 Second")
        app.toolbars["Toolbar"].buttons["Done"].tap()
        XCTAssertEqual(textField.value as? String ?? "", "6:7:17")
    }
    
}
