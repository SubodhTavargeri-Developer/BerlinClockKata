import XCTest
@testable import BerlinClockKata

class ClockTests: XCTestCase {
    
    let clock = Clock()
    
    func test_SecondsLightRowIsIlluminatedWithLightYellow_WhenSecondsValueIsEven() {
        let Time = Time(hours: 0, minutes: 0, seconds: 2)
        clock.setClockValues(time: Time)
        
        let originalValue = clock.secondLightRow()
        
        let expected = [Light.Yellow]
        XCTAssertEqual(originalValue, expected)
    }
    
    func test_SecondsLightRowIsIlluminatedWithLightOff_WhenSecondsValueIsOdd() {
        let Time = Time(hours: 0, minutes: 0, seconds: 5)
        clock.setClockValues(time: Time)
        
        let originalValue = clock.secondLightRow()
        
        let expected = [Light.Off]
        XCTAssertEqual(originalValue, expected)
    }
    
    func test_OneRedLightsAreIluminatedOfFiveHourRow_WhenHoursValueIsFive() {
        let Time = Time(hours: 5, minutes: 0, seconds: 0)
        clock.setClockValues(time: Time)
        
        let originalValue = clock.fiveHourLightRow()
        
        let expected = [Light.Red,Light.Off,Light.Off,Light.Off]
        XCTAssertEqual(originalValue, expected)
    }
    
    func test_TwoRedLightsAreIlluminatedOfFiveHourRow_WhenHoursValueIsTen() {
        let Time = Time(hours: 10, minutes: 0, seconds: 0)
        clock.setClockValues(time: Time)
        
        let originalValue = clock.fiveHourLightRow()
        
        let expected = [Light.Red,Light.Red,Light.Off,Light.Off]
        XCTAssertEqual(originalValue, expected)
    }
    
    func test_FourRedLightsAreIlluminatedOfFiveHourRow_WhenHoursValueIsTwenty() {
        let Time = Time(hours: 20, minutes: 0, seconds: 0)
        clock.setClockValues(time: Time)
        
        let originalValue = clock.fiveHourLightRow()
        
        let expected = [Light.Red,Light.Red,Light.Red,Light.Red]
        XCTAssertEqual(originalValue, expected)
    }
    
    func test_ZeroRedLightsAreIlluminatedOfFiveHourRow_WhenHoursValueIsZero() {
        let Time = Time(hours: 0, minutes: 0, seconds: 0)
        clock.setClockValues(time: Time)
        
        let originalValue = clock.fiveHourLightRow()
        
        let expected = [Light.Off,Light.Off,Light.Off,Light.Off]
        XCTAssertEqual(originalValue, expected)
    }
    
    func test_OneRedLightIsIlluminatedOfOneHourRow_WhenHoursValueisOne() {
        let Time = Time(hours: 1, minutes: 1, seconds: 0)
        clock.setClockValues(time: Time)
        
        let originalValue = clock.oneHourLightRow()
        
        let expected = [Light.Red,Light.Off,Light.Off,Light.Off]
        XCTAssertEqual(originalValue, expected)
    }
    
    func test_TwoRedLightsAreIlluminatedOfOneHourRow_WhenHoursValueisTwo() {
        let Time = Time(hours: 2, minutes: 0, seconds: 0)
        clock.setClockValues(time: Time)
        
        let originalValue = clock.oneHourLightRow()
        
        let expected = [Light.Red,Light.Red,Light.Off,Light.Off]
        XCTAssertEqual(originalValue, expected)
    }
    
    func test_FourRedLightsAreIlluminatedOfOneHourRow_WhenHoursValueisFour() {
        let Time = Time(hours: 4, minutes: 0, seconds: 0)
        clock.setClockValues(time: Time)
        
        let originalValue = clock.oneHourLightRow()
        
        let expected = [Light.Red,Light.Red,Light.Red,Light.Red]
        XCTAssertEqual(originalValue, expected)
    }
    
    func test_OneYellowLightIsIlluminatedOfFiveMinuteRow_WhenMinuteValueIsFive() {
        let Time = Time(hours: 0, minutes: 5, seconds: 0)
        clock.setClockValues(time: Time)
        
        let originalValue = clock.fiveMinuteLightRow()
        
        let expected = [Light.Yellow,Light.Off,Light.Off,Light.Off,Light.Off,
                        Light.Off,Light.Off,Light.Off,Light.Off,Light.Off,Light.Off]
        XCTAssertEqual(originalValue, expected)
    }
    
    func test_TwoYellowLightIsIlluminatedOfFiveMinuteRow_WhenMinuteValueIsTen() {
        let Time = Time(hours: 0, minutes: 10, seconds: 0)
        clock.setClockValues(time: Time)
        
        let originalValue = clock.fiveMinuteLightRow()
        
        let expected = [Light.Yellow,Light.Yellow,Light.Off,Light.Off,Light.Off,
                        Light.Off,Light.Off,Light.Off,Light.Off,Light.Off,Light.Off]
        XCTAssertEqual(originalValue, expected)
    }
    
    func test_TwoYellowLightAndOneRedLightIsIlluminatedOfFiveMinuteRow_WhenMinuteValueIsFifteen() {
        let Time = Time(hours: 0, minutes: 15, seconds: 0)
        clock.setClockValues(time: Time)
        
        let originalValue = clock.fiveMinuteLightRow()
        
        let expected = [Light.Yellow,Light.Yellow,Light.Red,Light.Off,Light.Off,
                        Light.Off,Light.Off,Light.Off,Light.Off,Light.Off,Light.Off]
        XCTAssertEqual(originalValue, expected)
    }
    
    func test_EightYellowLightAndThreeRedLightIAreIlluminatedOfFiveMinuteRow_WhenMinuteValueIsFifyNine() {
        let Time = Time(hours: 0, minutes: 59, seconds: 0)
        clock.setClockValues(time: Time)
        
        let originalValue = clock.fiveMinuteLightRow()
        
        let expected = [Light.Yellow,Light.Yellow,Light.Red,Light.Yellow,Light.Yellow,
                        Light.Red,Light.Yellow,Light.Yellow,Light.Red,Light.Yellow,Light.Yellow]
        XCTAssertEqual(originalValue, expected)
    }
    
    func test_ZeroYellowLightAndZeroRedLightAreIlluminatedOfFiveMinuteRow_WhenMinuteValueIsZero() {
        let Time = Time(hours: 0, minutes: 0, seconds: 0)
        clock.setClockValues(time: Time)
        
        let originalValue = clock.fiveMinuteLightRow()
        
        let expected = [Light.Off,Light.Off,Light.Off,Light.Off,Light.Off,
                        Light.Off,Light.Off,Light.Off,Light.Off,Light.Off,Light.Off]
        XCTAssertEqual(originalValue, expected)
    }
    
    func test_OneYellowLightIsIlluminatedOfOneMinuteRow_WhenMinuteValueIsOne() {
        let Time = Time(hours: 0, minutes: 1, seconds: 0)
        clock.setClockValues(time: Time)
        
        let originalValue = clock.oneMinuteLightRow()
        
        let expected = [Light.Yellow,Light.Off,Light.Off,Light.Off]
        XCTAssertEqual(originalValue, expected)
    }
    
    func test_TwoYellowLightAreIlluminatedOfOneMinuteRow_WhenMinuteValueIsTwo() {
        let Time = Time(hours: 0, minutes: 2, seconds: 0)
        clock.setClockValues(time: Time)
        
        let originalValue = clock.oneMinuteLightRow()
        
        let expected = [Light.Yellow,Light.Yellow,Light.Off,Light.Off]
        XCTAssertEqual(originalValue, expected)
    }
    
    func test_FourYellowLightAreIlluminatedOfOneMinuteRow_WhenMinuteValueIsFour() {
        let Time = Time(hours: 0, minutes: 4, seconds: 0)
        clock.setClockValues(time: Time)
        
        let originalValue = clock.oneMinuteLightRow()
        
        let expected = [Light.Yellow,Light.Yellow,Light.Yellow,Light.Yellow]
        XCTAssertEqual(originalValue, expected)
    }
    
    func test_ZeroYellowLightAreIlluminatedOfOneMinuteRow_WhenMinuteValueIsZero() {
        let Time = Time(hours: 0, minutes: 0, seconds: 0)
        clock.setClockValues(time: Time)
        
        let originalValue = clock.oneMinuteLightRow()
        
        let expected = [Light.Off,Light.Off,Light.Off,Light.Off]
        XCTAssertEqual(originalValue, expected)
    }
    
    func test_EntireBerlinClock_WhenTimeIsZeroZeroZero() {
        let Time = Time(hours: 0, minutes: 0, seconds: 0)
        clock.setClockValues(time: Time)
        
        var originalValue = clock.secondLightRow()
        originalValue.append(contentsOf: clock.fiveHourLightRow())
        originalValue.append(contentsOf: clock.oneHourLightRow())
        originalValue.append(contentsOf: clock.fiveMinuteLightRow())
        originalValue.append(contentsOf: clock.oneMinuteLightRow())
        
        let expected = [Light.Yellow,Light.Off,Light.Off,Light.Off,Light.Off,Light.Off
                        ,Light.Off,Light.Off,Light.Off,Light.Off,Light.Off,Light.Off
                        ,Light.Off,Light.Off,Light.Off,Light.Off,Light.Off,Light.Off
                        ,Light.Off,Light.Off,Light.Off,Light.Off,Light.Off,Light.Off]
        XCTAssertEqual(originalValue, expected)
    }
}
