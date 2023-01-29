//  Created by Subodh Tavargeri on 27/11/22.
//  Setup BerlinClock PresenterProtocol


class BerlinClockPresenter: BerlinClockPresenterProtocol {
    
    private weak var view: BerlinClockViewProtocol?
    private let clock: ClockProtocol
    
    ///  Setup presenter with Viewprotocol and ClockProtocol
    /// - Parameters:
    ///  - view: Setup viewProtocol
    ///  - clock: Clock Protocol
    init(view: BerlinClockViewProtocol,
         clock: ClockProtocol) {
        self.view = view
        self.clock = clock
    }
    
    //LoadPresenter with title and pickerValues
    func loadPresenter() {
        displayViewTitle()
        setTimePickerValues()
    }
    
    //Setup DoneButton Action, after user enter Presenter
    /// - Parameters:
    ///  - digitalTime: Setup DigitalTime received from user
    func handleTimeButtonAction(digitalTime: DigitalTime) {
        let berlinClock = clock.computeBerlinClockTime(for: digitalTime)
        view?.displayBerlinClockView(berlinClock: berlinClock)
    }
    
    //Setup title for View
    private func displayViewTitle() {
        view?.displayViewTitle(title: Constant.Title.screenTitle)
    }
    
    private func setTimePickerValues() {
        let timePickerModel = TimePickerModel(hoursEndValue: Constant.TimePicker.hours,
                                              minutesEndValue: Constant.TimePicker.minutes,
                                              secondsEndValue: Constant.TimePicker.seconds)
        view?.setTimePickerValues(timePickerModel: timePickerModel)
    }
}
