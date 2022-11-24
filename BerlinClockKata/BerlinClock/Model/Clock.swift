class Clock: ClockProtocol {
    
    private typealias numberOfLights = Int
    private typealias numberOfIlluminateLights = Int
    
    private struct numberOfLightsInARow {
        static let fiveHourRow = 4
        static let oneHourRow = 4
        static let fiveMinuteRow = 11
        static let oneMinuteRow = 4
    }
    
    private struct lightQuotient {
        static let fiveHourQuotient = 5
        static let fiveMinuteQuotient = 5
    }
    
    private struct lightRemainder {
        static let oneHourRemainder = 5
        static let oneMinuteRemainder = 5
        static let secondRemainder = 2
        static let thirdLightInFiveMinuteRemainder = 3
    }
    
    func computeBerlinClockTime(for digitalTime: DigitalTime) -> BerlinClockTime {
        BerlinClockTime(secondsLight: secondLightRow(digitalTime.seconds),
                        fiveHoursLights: fiveHourLightRow(digitalTime.hours),
                        oneHoursLights: oneHourLightRow(digitalTime.hours),
                        fiveMinutesLights: fiveMinuteLightRow(digitalTime.minutes),
                        oneMinutesLights: oneMinuteLightRow(digitalTime.minutes)
        )
    }
    
    private func secondLightRow(_ seconds: DigitalSeconds)-> Light {
        return seconds%lightRemainder.secondRemainder == 0 ? .Yellow: .Off
    }
    
    private func fiveHourLightRow(_ hours: DigitalHours)-> [Light] {
        let numberOfRedLights = hours/lightQuotient.fiveHourQuotient
        
        let totalNumberOfLights = totalLightsForARowContainingIlluminatedLights(
            totalNumberOfLightsInARow: numberOfLightsInARow.fiveHourRow,
            numberOfIlluminatedLights: numberOfRedLights,
            illuminatedLight: .Red)
        
        return totalNumberOfLights
    }
    
    private func oneHourLightRow(_ hours: DigitalHours)-> [Light] {
        let numberOfRedLights = hours%lightRemainder.oneHourRemainder
        
        let totalNumberOfLights = totalLightsForARowContainingIlluminatedLights(
            totalNumberOfLightsInARow: numberOfLightsInARow.oneHourRow,
            numberOfIlluminatedLights: numberOfRedLights,
            illuminatedLight: .Red)
        
        return totalNumberOfLights
    }
    
    private func fiveMinuteLightRow(_ minutes: DigitalMinutes)-> [Light] {
        let numberOfIlluminatedLights = minutes/lightQuotient.fiveMinuteQuotient
        
        var totalNumberOfLights = totalLightsForARowContainingIlluminatedLights(
            totalNumberOfLightsInARow:numberOfLightsInARow.fiveMinuteRow,
            numberOfIlluminatedLights: numberOfIlluminatedLights,
            illuminatedLight: .Yellow)
        
        for index in 1...totalNumberOfLights.count where
        isThirdLightYellowInFiveMinuteLightRow(index: index, totalLights: totalNumberOfLights) {
            totalNumberOfLights[index-1] = Light.Red
        }
        
        return totalNumberOfLights
    }
    
    private func oneMinuteLightRow(_ minutes: DigitalMinutes)-> [Light] {
        let numberOfYellowLights = minutes%lightRemainder.oneMinuteRemainder
        
        let totalNumberOfLights = totalLightsForARowContainingIlluminatedLights(totalNumberOfLightsInARow:
                                                                        numberOfLightsInARow.oneMinuteRow,
                                                                        numberOfIlluminatedLights: numberOfYellowLights,
                                                                        illuminatedLight: .Yellow)
        
        return totalNumberOfLights
    }
    
    private func isThirdLightYellowInFiveMinuteLightRow(index: Int,
                                                        totalLights: [Light])-> Bool {
        return index%lightRemainder.thirdLightInFiveMinuteRemainder == 0
        && totalLights[index-1] == .Yellow
    }
    
    private func totalLightsForARowContainingIlluminatedLights(totalNumberOfLightsInARow: numberOfLights,
                                                               numberOfIlluminatedLights: numberOfIlluminateLights,
                                                               illuminatedLight: Light)-> [Light] {
        
        var totalNumberOfLights = [Light]()
        
        for _ in 0..<totalNumberOfLightsInARow {
            totalNumberOfLights.append(.Off)
        }
        
        for index in 0..<numberOfIlluminatedLights {
            totalNumberOfLights[index] = illuminatedLight
        }
        
        return totalNumberOfLights
    }
    
}
