//  Created by Subodh Tavargeri on 27/11/22.
//  Setup MockData for Clock

@testable import BerlinClockKata

class ClockMock: ClockProtocol {
    
    private var berlinClockTime: BerlinClockTime = BerlinClockTimeBuilder().build()
    private (set) var receivedInput: DigitalTime?
    
    func computeBerlinClockTime(for digitalTime: DigitalTime) -> BerlinClockTime {
        receivedInput = digitalTime
        return berlinClockTime
    }
    
    func mockBerlinClockTime(berlinClockTime: BerlinClockTime) {
        self.berlinClockTime = berlinClockTime
    }
}
