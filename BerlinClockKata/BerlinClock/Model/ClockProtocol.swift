//  Created by Subodh Tavargeri on 26/11/22.
//  Set ClockProtocol

protocol ClockProtocol {
    func computeBerlinClockTime(for digitalTime: DigitalTime)-> BerlinClockTime
}
