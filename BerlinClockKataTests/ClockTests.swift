import XCTest
@testable import BerlinClockKata

class ClockTests: XCTestCase {
    
    func test_SecondsLightRowIsIlluminatedWithLightYellow_WhenSecondsValueIsEven() {
        let clock = Clock()
        clock.setClockValues(seconds: 2)
        
        let originalValue = clock.isSecondRowLightIlluminated()
        
        let expected = Lights.Yellow
        XCTAssertEqual(originalValue, expected)
    }
    
    func test_SecondsLightRowIsIlluminatedWithLightOff_WhenSecondsValueIsOdd() {
        let clock = Clock()
        clock.setClockValues(seconds: 5)
        
        let originalValue = clock.isSecondRowLightIlluminated()
        
        let expected = Lights.Off
        XCTAssertEqual(originalValue, expected)
    }
    
    func test_OneRedLightsAreIluminatedOfFiveHourRow_WhenHourValueIsFive() {
        let clock = Clock()
        
        let originalValue = clock.fiveHourLightRow()
        
        let expected = [Lights.Red,Lights.Off,Lights.Off,Lights.Off]
        XCTAssertEqual(originalValue, expected)
    }
    
}
