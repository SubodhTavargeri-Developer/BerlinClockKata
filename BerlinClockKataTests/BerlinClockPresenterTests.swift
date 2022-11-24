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
        
        XCTAssertEqual(view.title, Constant.Title.screenTitle)
    }
    
    func test_DisplayedBerlinClockIsEqualToMock_OnHandleTimeButtonAction() {
        let berlinClockTime = BerlinClockTimeBuilder()
            .withFiveHourLights([.Red, .Red, .Off, .Off])
            .build()
        clock.mockBerlinClockTime(berlinClockTime: berlinClockTime)
        let digitalClock = DigitalTime(hours: 2, minutes: 2, seconds: 2)
        
        presenter.handleTimeButtonAction(digitalTime: digitalClock)
        
        XCTAssertEqual(view.clock, berlinClockTime)
    }
    
    func test_ViewTimePickerValuesAreUpdated_WhenPresenterLoads() {
        presenter.loadPresenter()
        
        let expected = TimePickerModel(hoursEndValue: Constant.TimePicker.hours,
                                       minutesEndValue: Constant.TimePicker.minutes,
                                       secondsEndValue: Constant.TimePicker.seconds)
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
