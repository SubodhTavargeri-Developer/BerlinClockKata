@testable import BerlinClockKata

class BerlinClockViewControllerSpy: BerlinClockViewProtocol {
    private (set) var title: String?
    private (set) var clock: BerlinClockTime?
    private (set) var timePicker: TimePickerModel?
    
    func displayViewTitle(title: ViewTitle) {
        self.title = title
    }
    
    func displayBerlinClockView(berlinClock: BerlinClockTime) {
        clock = berlinClock
    }
    
    func setTimePickerValues(timePickerModel: TimePickerModel) {
        timePicker = timePickerModel
    }
}
