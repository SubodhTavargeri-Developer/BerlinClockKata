@testable import BerlinClockKata

class ClockMock: ClockProtocol {
    
    private var berlinClockTime: BerlinClockTime = BerlinClockTimeBuilder().build()
    
    func computeBerlinClockTime(for digitalTime: DigitalTime) -> BerlinClockTime {
        return berlinClockTime
    }
    
    func mockBerlinClockTime(berlinClockTime: BerlinClockTime) {
        self.berlinClockTime = berlinClockTime
    }
}
