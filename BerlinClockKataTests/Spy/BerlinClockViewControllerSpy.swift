@testable import BerlinClockKata

class BerlinClockViewControllerSpy: BerlinClockViewProtocol {
    
    var title: String?
    var clock: BerlinClockTime?
    func displayViewTitle(title: String) {
        self.title = title
    }
    
    func displayBerlinClockView(berlinClock: BerlinClockTime) {
        clock = berlinClock
    }
}
