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
        timePickerValues()
    }
    
    func handleConvertTimeButtonAction(digitalTime: DigitalTime) {
        let berlinClock = clock.computeBerlinClockTime(for: digitalTime)
        view?.displayBerlinClockView(berlinClock: berlinClock)
    }
    
    private func displayViewTitle() {
        view?.displayViewTitle(title: Constant.Title.screenTitle)
    }
    
    private func timePickerValues() {
        let timePickerModel = TimePickerModel(numberofRows:Constant.TimePicker.numberOfRows,
                                              hoursEndValue: Constant.TimePicker.hours,
                                              minutesEndValue: Constant.TimePicker.minutes,
                                              secondsEndValue: Constant.TimePicker.seconds)
        view?.timePickerValues(timePickerModel: timePickerModel)
    }
    
}
