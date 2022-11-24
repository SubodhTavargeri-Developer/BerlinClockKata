@testable import BerlinClockKata

class BerlinClockViewControllerSpy: BerlinClockViewProtocol {
    var title: String?
    var clock: BerlinClockTime?
    var timePicker: TimePickerModel?
    
    func displayViewTitle(title: String) {
        self.title = title
    }
    
    func displayBerlinClockView(berlinClock: BerlinClockTime) {
        clock = berlinClock
    }
    
    func setTimePickerValues(timePickerModel: TimePickerModel) {
        timePicker = timePickerModel
    }
}
