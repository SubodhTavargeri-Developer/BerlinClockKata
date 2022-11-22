import XCTest
@testable import BerlinClockKata

class BerlinClockPresenterTests: XCTestCase {
    
    func test_ViewTitleIsDisplayed_WhenPresenterLoads() {
        let view = BerlinClockViewControllerSpy()
        let clock = ClockMock()
        let presenter = BerlinClockPresenter(view: view, clock: clock)
        
        presenter.loadPresenter()
        
        XCTAssertEqual(view.title, Constant.Title.screenTitle)
    }
    
    func test_ComputedFiveHourLightBerlinClockTimeIsEqualToMock_WhenPresenterSendsDigitalTimeToClock() {
        let view = BerlinClockViewControllerSpy()
        let clock = ClockMock()
        clock.mockBerlinClockTime(berlinClockTime: BerlinClockMock.getBerlinClockTime())
        let presenter = BerlinClockPresenter(view: view, clock: clock)
        let digitalClock = DigitalTime(hours: 2, minutes: 2, seconds: 2)
        
        presenter.displayBerlinClock(digitalTime: digitalClock)
        
        let expected = BerlinClockMock.getBerlinClockTime()
        XCTAssertEqual(view.clock, expected)
    }
}
extension BerlinClockTime: Equatable {
    public static func == (lhs: BerlinClockTime, rhs: BerlinClockTime) -> Bool {
        return lhs.secondsLight == rhs.secondsLight
        && lhs.fiveHoursLights == rhs.fiveHoursLights
        && lhs.oneHoursLights == rhs.oneHoursLights
        && lhs.fiveMinutesLights == rhs.fiveMinutesLights
        && lhs.oneMinutesLights == rhs.oneMinutesLights
    }
}
