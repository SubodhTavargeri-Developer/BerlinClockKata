import XCTest
@testable import BerlinClockKata

class ClockTests: XCTestCase {
    
    func test_SecondsLightRowIsIlluminated_WhenSecondsValueIsEven() {
        let clock = Clock()
        
        clock.setClockValues(seconds: 2)
        
        let IsIlluminated = clock.isSecondLightIlluminated()
        XCTAssertTrue(IsIlluminated)
    }
    
    func test_SecondsLightRowIsNotIlluminated_WhenSecondsValueIsOdd() {
        let clock = Clock()
        
        clock.setClockValues(seconds: 5)
        
        let IsIlluminated = clock.isSecondLightIlluminated()
        XCTAssertFalse(IsIlluminated)
    }
    
}
