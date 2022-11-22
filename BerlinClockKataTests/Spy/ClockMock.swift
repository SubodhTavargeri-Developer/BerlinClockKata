@testable import BerlinClockKata

class ClockMock: ClockProtocol {
    
    var berlinClockTime: BerlinClockTime?
    
    func computeBerlinClockTime(for digitalTime: DigitalTime) -> BerlinClockTime {
        let berlinClock = BerlinClockMock.getBerlinClockTime()
        return berlinClock
    }
    
    func mockBerlinClockTime(berlinClockTime: BerlinClockTime) {
        self.berlinClockTime = berlinClockTime
    }
}
