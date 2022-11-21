import XCTest
@testable import BerlinClockKata

class ClockTests: XCTestCase {
    
    func test_SecondsLightRowIsIlluminated_WhenSecondsValueIsEven() {
        let clock = Clock()
        
        let IsIlluminated = clock.isSecondLightIlluminated()
        XCTAssertTrue(IsIlluminated)
    }
    
}
