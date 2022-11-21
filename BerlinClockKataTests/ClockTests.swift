import XCTest
@testable import BerlinClockKata

class ClockTests: XCTestCase {
    
    let clock = Clock()
    
    func test_SecondsLightRowIsIlluminatedWithLightYellow_WhenSecondsValueIsEven() {
        clock.setClockValues(hours: 0, seconds: 2)
        
        let originalValue = clock.isSecondRowLightIlluminated()
        
        let expected = Lights.Yellow
        XCTAssertEqual(originalValue, expected)
    }
    
    func test_SecondsLightRowIsIlluminatedWithLightOff_WhenSecondsValueIsOdd() {
        clock.setClockValues(hours: 0, seconds: 5)
        
        let originalValue = clock.isSecondRowLightIlluminated()
        
        let expected = Lights.Off
        XCTAssertEqual(originalValue, expected)
    }
    
    func test_OneRedLightsAreIluminatedOfFiveHourRow_WhenHoursValueIsFive() {
        clock.setClockValues(hours: 5, seconds: 0)
        
        let originalValue = clock.fiveHourLightRow()
        
        let expected = [Lights.Red,Lights.Off,Lights.Off,Lights.Off]
        XCTAssertEqual(originalValue, expected)
    }
    
    func test_TwoRedLightsAreIlluminatedOfFiveHourRow_WhenHoursValueIsTen() {
        clock.setClockValues(hours: 10, seconds: 0)
        
        let originalValue = clock.fiveHourLightRow()
        
        let expected = [Lights.Red,Lights.Red,Lights.Off,Lights.Off]
        XCTAssertEqual(originalValue, expected)
    }
    
}
