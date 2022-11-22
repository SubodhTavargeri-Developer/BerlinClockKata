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
        let berlin = BerlinClockTime(fiveHoursLights: fiveHourLight, oneHoursLights: oneHourLight, fiveMinutesLights: fiveMinutesLights, oneMinutesLights: oneMinuteLight, secondsLight: secondLight)
        return berlin
    }
}
