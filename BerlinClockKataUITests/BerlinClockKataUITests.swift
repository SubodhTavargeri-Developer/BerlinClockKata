import XCTest

class BerlinClockKataUITests: XCTestCase {
    
    func test_WhenDigitalTimeIsSixHourSevenMinuteSeventeenSec() {
        
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
    
    
    func testNewdsdasd() {
        
        let x = 2
        
        
        let app = XCUIApplication()
        app.toolbars["Toolbar"].buttons["Done"].tap()
        
        let element2 = app.children(matching: .window).element(boundBy: 0).children(matching: .other).element.children(matching: .other).element.children(matching: .other).element.children(matching: .other).element.children(matching: .other).element.children(matching: .other).element.children(matching: .other).element.children(matching: .other).element
        let element6 = element2.children(matching: .other).element(boundBy: 1)
        let element = element6.children(matching: .other).element(boundBy: 0)
        element.tap()
        element6.children(matching: .other).element(boundBy: 1).tap()
        element.tap()
        
        let element3 = element2.children(matching: .other).element(boundBy: 2).children(matching: .other).element(boundBy: 0)
        element3.tap()
        element2.children(matching: .other).element(boundBy: 3).children(matching: .other).element(boundBy: 0).tap()
        
        let element7 = element2.children(matching: .other).element(boundBy: 4)
        let element4 = element7.children(matching: .other).element(boundBy: 0)
        element4.tap()
        
        let element5 = element7.children(matching: .other).element(boundBy: 1)
        element5.tap()
        element4.tap()
        element5.tap()
        element.tap()
        element3.tap()
        element4.tap()
        element4.tap()
        app/*@START_MENU_TOKEN@*/.textFields["digitalTime_textField"]/*[[".textFields[\"hh:mm:ss\"]",".textFields[\"digitalTime_textField\"]"],[[[-1,1],[-1,0]]],[0]]@END_MENU_TOKEN@*/.tap()
        
    }
    
    //    func testXHIKDJLKDJ() {
    //        app2.pickerWheels["0 Second"].press(forDuration: 0.5);
    //        app2/*@START_MENU_TOKEN@*/.pickerWheels["1 Second"].press(forDuration: 0.5);/*[[".pickers[\"digitalTime_picker\"].pickerWheels[\"1 Second\"]",".tap()",".press(forDuration: 0.5);",".pickerWheels[\"1 Second\"]"],[[[-1,3,1],[-1,0,1]],[[-1,2],[-1,1]]],[0,0]]@END_MENU_TOKEN@*/
    //        app2.pickerWheels["2 Second"].tap()
    //        app2/*@START_MENU_TOKEN@*/.pickerWheels["0 Minute"]/*[[".pickers[\"digitalTime_picker\"].pickerWheels[\"0 Minute\"]",".pickerWheels[\"0 Minute\"]"],[[[-1,1],[-1,0]]],[0]]@END_MENU_TOKEN@*/.swipeUp()
    //        app2/*@START_MENU_TOKEN@*/.pickerWheels["6 Minute"]/*[[".pickers[\"digitalTime_picker\"].pickerWheels[\"6 Minute\"]",".pickerWheels[\"6 Minute\"]"],[[[-1,1],[-1,0]]],[0]]@END_MENU_TOKEN@*/.tap()
    //        app2/*@START_MENU_TOKEN@*/.pickerWheels["8 Minute"]/*[[".pickers[\"digitalTime_picker\"].pickerWheels[\"8 Minute\"]",".pickerWheels[\"8 Minute\"]"],[[[-1,1],[-1,0]]],[0]]@END_MENU_TOKEN@*/.tap()
    //        app2/*@START_MENU_TOKEN@*/.pickerWheels["0 Hour"]/*[[".pickers[\"digitalTime_picker\"].pickerWheels[\"0 Hour\"]",".pickerWheels[\"0 Hour\"]"],[[[-1,1],[-1,0]]],[0]]@END_MENU_TOKEN@*/.swipeUp()
    //        app2/*@START_MENU_TOKEN@*/.pickerWheels["1 Hour"]/*[[".pickers[\"digitalTime_picker\"].pickerWheels[\"1 Hour\"]",".pickerWheels[\"1 Hour\"]"],[[[-1,1],[-1,0]]],[0]]@END_MENU_TOKEN@*/.swipeUp()
    //        app2/*@START_MENU_TOKEN@*/.pickerWheels["2 Hour"]/*[[".pickers[\"digitalTime_picker\"].pickerWheels[\"2 Hour\"]",".pickerWheels[\"2 Hour\"]"],[[[-1,1],[-1,0]]],[0]]@END_MENU_TOKEN@*/.swipeUp()
    //        app2/*@START_MENU_TOKEN@*/.pickerWheels["7 Hour"]/*[[".pickers[\"digitalTime_picker\"].pickerWheels[\"7 Hour\"]",".pickerWheels[\"7 Hour\"]"],[[[-1,1],[-1,0]]],[0]]@END_MENU_TOKEN@*/.tap()
    //        app2/*@START_MENU_TOKEN@*/.pickerWheels["8 Hour"]/*[[".pickers[\"digitalTime_picker\"].pickerWheels[\"8 Hour\"]",".pickerWheels[\"8 Hour\"]"],[[[-1,1],[-1,0]]],[0]]@END_MENU_TOKEN@*/.tap()
    //        app.toolbars["Toolbar"].buttons["Done"].tap()
    //    }
}
