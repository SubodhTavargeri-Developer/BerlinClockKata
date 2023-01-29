//  Created by Subodh Tavargeri on 24/11/22.
//  Logic to convert DigitalTime received to BerlinClockTime


class Clock: ClockProtocol {
    
    private typealias NumberOfLights = Int
    private typealias NumberOfIlluminateLights = Int
    private typealias CurrentIndex = Int
    
    private struct NumberOfLightsInARow {
        static let fiveHourRow = 4
        static let oneHourRow = 4
        static let fiveMinuteRow = 11
        static let oneMinuteRow = 4
        static let nextIndex = 1
    }
    
    private struct LightQuotient {
        static let fiveHourQuotient = 5
        static let fiveMinuteQuotient = 5
    }
    
    private struct LightRemainder {
        static let oneHourRemainder = 5
        static let oneMinuteRemainder = 5
        static let secondRemainder = 2
        static let thirdLightInFiveMinuteRemainder = 3
    }
    
    /// Convert DigitalTime model to BerlinClockTime model
    /// - Parameters:
    ///  - digitalTime: DigitalTime model
    /// - Returns: BerlinClockTime model
    func computeBerlinClockTime(for digitalTime: DigitalTime)-> BerlinClockTime {
        BerlinClockTime(secondsLight: secondLightRow(digitalTime.seconds),
                        fiveHoursLights: fiveHourLightRow(digitalTime.hours),
                        oneHoursLights: oneHourLightRow(digitalTime.hours),
                        fiveMinutesLights: fiveMinuteLightRow(digitalTime.minutes),
                        oneMinutesLights: oneMinuteLightRow(digitalTime.minutes)
        )
    }
    
    /// Calculate SecondsLight Row
    /// - Parameters:
    ///  - seconds: DigitalTime seconds Model
    /// - Returns: Light Color
    private func secondLightRow(_ seconds: DigitalSeconds)-> Light {
        return seconds % LightRemainder.secondRemainder == 0 ? .Yellow: .Off
    }
    
    /// Calculate FiveHourLightRow
    /// - Parameters:
    ///  - seconds: DigitalTime hours Model
    /// - Returns: Array of Light Color
    private func fiveHourLightRow(_ hours: DigitalHours)-> [Light] {
        let numberOfRedLights = hours / LightQuotient.fiveHourQuotient
        
        return totalLightsForARowContainingIlluminatedLights(totalNumberOfLightsInARow: NumberOfLightsInARow.fiveHourRow,
                                                             numberOfIlluminatedLights: numberOfRedLights,
                                                             illuminatedLight: .Red)
    }
    
    /// Calculate OneHourLightRow
    /// - Parameters:
    ///  - seconds: DigitalTime hours Model
    /// - Returns: Array of Light Color
    private func oneHourLightRow(_ hours: DigitalHours)-> [Light] {
        let numberOfRedLights = hours % LightRemainder.oneHourRemainder
        
        return totalLightsForARowContainingIlluminatedLights(totalNumberOfLightsInARow: NumberOfLightsInARow.oneHourRow,
                                                             numberOfIlluminatedLights: numberOfRedLights,
                                                             illuminatedLight: .Red)
    }
    
    /// Calculate FiveMinuteLightRow
    /// - Parameters:
    ///  - minutes: DigitalTime minutes Model
    /// - Returns: Array of Light Color
    private func fiveMinuteLightRow(_ minutes: DigitalMinutes)-> [Light] {
        let numberOfIlluminatedLights = minutes / LightQuotient.fiveMinuteQuotient
        
        var totalNumberOfLights = totalLightsForARowContainingIlluminatedLights(totalNumberOfLightsInARow: NumberOfLightsInARow.fiveMinuteRow,
                                                                                numberOfIlluminatedLights: numberOfIlluminatedLights,
                                                                                illuminatedLight: .Yellow)
        totalNumberOfLights =  totalNumberOfLights.enumerated().map { index,
            element in isThirdLightYellowInFiveMinuteLightRow(index: index + NumberOfLightsInARow.nextIndex,
                                                              totalLights: totalNumberOfLights) ? .Red : element
        }
        
        
        return totalNumberOfLights
    }
    
    /// Calculate OneMinuteLightRow
    /// - Parameters:
    ///  - minutes: DigitalTime minutes Model
    /// - Returns: Array of Light Color
    private func oneMinuteLightRow(_ minutes: DigitalMinutes)-> [Light] {
        let numberOfYellowLights = minutes % LightRemainder.oneMinuteRemainder
        
        return totalLightsForARowContainingIlluminatedLights(totalNumberOfLightsInARow: NumberOfLightsInARow.oneMinuteRow,
                                                             numberOfIlluminatedLights: numberOfYellowLights,
                                                             illuminatedLight: .Yellow)
        
    }
    
    /// Check if Third Light is Yellow in FiveMinute Low Row
    /// - Parameters:
    ///  - minutes: DigitalTime minutes Model
    /// - Returns: Array of Light Color
    private func isThirdLightYellowInFiveMinuteLightRow(index: CurrentIndex,
                                                        totalLights: [Light])-> Bool {
        return index % LightRemainder.thirdLightInFiveMinuteRemainder == 0
        && totalLights[index-1] == .Yellow
    }
    
    private func totalLightsForARowContainingIlluminatedLights(totalNumberOfLightsInARow: NumberOfLights,
                                                               numberOfIlluminatedLights: NumberOfIlluminateLights,
                                                               illuminatedLight: Light)-> [Light] {
        
        let totalNumberOfLightsOn = [Light](repeating: illuminatedLight, count: numberOfIlluminatedLights)
        
        let totalNumberOfLightsOff = [Light](repeating: .Off, count: totalNumberOfLightsInARow - numberOfIlluminatedLights)
        
        return totalNumberOfLightsOn + totalNumberOfLightsOff
    }
}
