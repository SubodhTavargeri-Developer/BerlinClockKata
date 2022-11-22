import XCTest
@testable import BerlinClockKata

class BerlinClockPresenterTests: XCTestCase {
    private var view: BerlinClockViewControllerSpy!
    private var clock: ClockMock!
    private var presenter: BerlinClockPresenter!
    
    override func setUp() {
        view = BerlinClockViewControllerSpy()
        clock = ClockMock()
        presenter = BerlinClockPresenter(view: view,
                                         clock: clock)
    }
    
    func test_ViewTitleIsDisplayed_WhenPresenterLoads() {
        presenter.loadPresenter()
        
        XCTAssertEqual(view.title, Constant.Title.screenTitle)
    }
    
    func test_ComputedFiveHourLightBerlinClockTimeIsEqualToMock_WhenPresenterSendsDigitalTimeToClock() {
        let berlinClockTime =  BerlinClockTimeBuilder()
            .withFiveHourLights([.Red, .Red, .Off, .Off])
            .build()
        clock.mockBerlinClockTime(berlinClockTime: berlinClockTime)
        let digitalClock = DigitalTime(hours: 2, minutes: 2, seconds: 2)
        
        presenter.displayBerlinClock(digitalTime: digitalClock)
        
        XCTAssertEqual(view.clock, berlinClockTime)
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
