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
    
    func displayBerlinClock(digitalTime: DigitalTime) {
        let berlinClock = clock.computeBerlinClockTime(for: digitalTime)
        view?.displayBerlinClockView(berlinClock: berlinClock)
    }
    
    private func displayViewTitle() {
        view?.displayViewTitle(title: Constant.Title.screenTitle)
    }
    
    private func timePickerValues() {
        let timePickerModel = TimePickerModel(hoursEndValue: 24, minutesEndValue: 60, secondsEndValue: 60)
        view?.timePickerValues(timePickerModel: timePickerModel)
    }
    
}
