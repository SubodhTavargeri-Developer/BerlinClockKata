@testable import BerlinClockKata

class ClockSpy: ClockProtocol {
    
    func computeBerlinClockTime(for digitalTime: DigitalTime) -> BerlinClockTime {
        let berlinClock = BerlinClockMock.getBerlinClockTime()
        return berlinClock
    }
}
