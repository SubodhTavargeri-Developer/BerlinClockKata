import XCTest
@testable import BerlinClockKata

class BerlinClockPresenterTests: XCTestCase {
    private let view = BerlinClockViewControllerSpy()
    private let clock = ClockMock()
    private var presenter: BerlinClockPresenter!

    override func setUp() {
        presenter = BerlinClockPresenter(view: view,
                                         clock: clock)
    }
    
    func test_ViewTitleIsDisplayed_WhenPresenterLoads() {
        presenter.loadPresenter()
        
        let expectedTitle = "Berlin Clock"
        XCTAssertEqual(view.title, expectedTitle)
    }
    
    func test_DisplayedBerlinClockIsEqualToMock_OnHandleTimeButtonAction() {
        let berlinClockTime = BerlinClockTimeBuilder()
            .withFiveHourLights([.Red, .Red, .Off, .Off])
            .build()
        clock.mockBerlinClockTime(berlinClockTime: berlinClockTime)
        let digitalClock = DigitalTime(hours: 2, minutes: 2, seconds: 2)
        
        presenter.handleTimeButtonAction(digitalTime: digitalClock)
        
        XCTAssertEqual(view.clock, berlinClockTime)
        XCTAssertEqual(clock.receivedInput, digitalClock)
    }
    
    func test_ViewTimePickerValuesAreUpdated_WhenPresenterLoads() {
        presenter.loadPresenter()
        
        let expected = TimePickerModel(hoursEndValue: 24,
                                       minutesEndValue: 60,
                                       secondsEndValue: 60)
        XCTAssertEqual(view.timePicker, expected)
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

extension TimePickerModel: Equatable {
    public static func == (lhs: TimePickerModel, rhs: TimePickerModel)-> Bool {
        return lhs.hoursEndValue == rhs.hoursEndValue
        && lhs.minutesEndValue == rhs.minutesEndValue
        && lhs.secondsEndValue == rhs.secondsEndValue
    }
}

extension DigitalTime: Equatable {
    public static func == (lhs: DigitalTime, rhs: DigitalTime)-> Bool {
        return lhs.hours == lhs.hours
        && lhs.minutes == rhs.minutes
        && lhs.seconds == rhs.seconds
    }
}
