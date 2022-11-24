class BerlinClockPresenter: BerlinClockPresenterProtocol {
    
    private weak var view: BerlinClockViewProtocol?
    private let clock: ClockProtocol
    
    init(view: BerlinClockViewProtocol,
         clock: ClockProtocol) {
        self.view = view
        self.clock = clock
    }
    
    func loadPresenter() {
        displayViewTitle()
        setTimePickerValues()
    }
    
    func handleTimeButtonAction(digitalTime: DigitalTime) {
        let berlinClock = clock.computeBerlinClockTime(for: digitalTime)
        view?.displayBerlinClockView(berlinClock: berlinClock)
    }
    
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
