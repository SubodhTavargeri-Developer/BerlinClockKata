//  Created by Subodh Tavargeri on 27/11/22.
//  Setup MockData for BerlinClock

@testable import BerlinClockKata

struct BerlinClockMock {
    
    static func getBerlinClockTime()-> BerlinClockTime {
        let fiveHourLight:[Light] = [.Red,.Red,.Red,.Off]
        let oneHourLight:[Light] = [.Red,.Red,.Off,.Off]
        let fiveMinutesLights:[Light] = [.Yellow,.Yellow,.Red,.Off,
                                         .Yellow,.Yellow,.Red,.Off,
                                         .Yellow,.Yellow,.Red]
        let oneMinuteLight:[Light] = [.Yellow,.Yellow,.Off,.Off]
        let secondLight:Light = .Yellow
        let berlinClockTime = BerlinClockTime(secondsLight: secondLight,
                                     fiveHoursLights: fiveHourLight,
                                     oneHoursLights: oneHourLight,
                                     fiveMinutesLights: fiveMinutesLights,
                                     oneMinutesLights: oneMinuteLight)
        return berlinClockTime
    }
}
