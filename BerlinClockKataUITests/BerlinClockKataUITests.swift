import XCTest

class BerlinClockKataUITests: XCTestCase {
    let app = XCUIApplication()
    
    override func setUp() {
        XCUIApplication().activate()
    }
    
    func test_WhenDigitalTimeIsSixHoursSevenMinutesSeventeenSeconds_SixHourSevenMinuteSeventeenSecIsSelectedFromPicker() {
        let textField = app.textFields["digitalTime_textField"]
        textField.tap()
        
        app.pickerWheels.element(boundBy: 0).adjust(toPickerWheelValue: "6 Hour")
        app.pickerWheels.element(boundBy: 1).adjust(toPickerWheelValue: "7 Minute")
        app.pickerWheels.element(boundBy: 2).adjust(toPickerWheelValue: "17 Second")
        app.toolbars["Toolbar"].buttons["Done"].tap()
        
        XCTAssertEqual(textField.value as? String ?? "", "6:7:17")
    }
    
    func test_SecondLightRowAndHourLightRowExists_WhenTimeSelectedIsEightHourSeventeenMinuteThirtySevenSecIsSelectedFromPicker() {
        let textField = app.textFields["digitalTime_textField"]
        textField.tap()
        
        app.pickerWheels.element(boundBy: 0).adjust(toPickerWheelValue: "8 Hour")
        app.pickerWheels.element(boundBy: 1).adjust(toPickerWheelValue: "17 Minute")
        app.pickerWheels.element(boundBy: 2).adjust(toPickerWheelValue: "37 Second")
        
        app.toolbars["Toolbar"].buttons["Done"].tap()
  
        let secondValue = app.otherElements["secondsLight0"]
        XCTAssert(secondValue.exists)
        let hourValue = app.otherElements["fiveHourLight0"]
        XCTAssert(hourValue.exists)
    }
}
