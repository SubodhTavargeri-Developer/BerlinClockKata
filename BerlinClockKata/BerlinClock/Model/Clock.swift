class Clock: ClockProtocol {
    
    private typealias NumberOfLights = Int
    private typealias NumberOfIlluminateLights = Int
    private typealias CurrentIndex = Int
    
    private struct NumberOfLightsInARow {
        static let fiveHourRow = 4
        static let oneHourRow = 4
        static let fiveMinuteRow = 11
        static let oneMinuteRow = 4
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
    
    func computeBerlinClockTime(for digitalTime: DigitalTime)-> BerlinClockTime {
        BerlinClockTime(secondsLight: secondLightRow(digitalTime.seconds),
                        fiveHoursLights: fiveHourLightRow(digitalTime.hours),
                        oneHoursLights: oneHourLightRow(digitalTime.hours),
                        fiveMinutesLights: fiveMinuteLightRow(digitalTime.minutes),
                        oneMinutesLights: oneMinuteLightRow(digitalTime.minutes)
        )
    }
    
    private func secondLightRow(_ seconds: DigitalSeconds)-> Light {
        return seconds % LightRemainder.secondRemainder == 0 ? .Yellow: .Off
    }
    
    private func fiveHourLightRow(_ hours: DigitalHours)-> [Light] {
        let numberOfRedLights = hours / LightQuotient.fiveHourQuotient
        
        return totalLightsForARowContainingIlluminatedLights(totalNumberOfLightsInARow: NumberOfLightsInARow.fiveHourRow,
                                                             numberOfIlluminatedLights: numberOfRedLights,
                                                             illuminatedLight: .Red)
    }
    
    private func oneHourLightRow(_ hours: DigitalHours)-> [Light] {
        let numberOfRedLights = hours % LightRemainder.oneHourRemainder
        
        return totalLightsForARowContainingIlluminatedLights(totalNumberOfLightsInARow: NumberOfLightsInARow.oneHourRow,
                                                             numberOfIlluminatedLights: numberOfRedLights,
                                                             illuminatedLight: .Red)
    }
    
    private func fiveMinuteLightRow(_ minutes: DigitalMinutes)-> [Light] {
        let numberOfIlluminatedLights = minutes / LightQuotient.fiveMinuteQuotient
        
        var totalNumberOfLights = totalLightsForARowContainingIlluminatedLights(totalNumberOfLightsInARow: NumberOfLightsInARow.fiveMinuteRow,
                                                                                numberOfIlluminatedLights: numberOfIlluminatedLights,
                                                                                illuminatedLight: .Yellow)
        
        for index in 1...totalNumberOfLights.count where
        isThirdLightYellowInFiveMinuteLightRow(index: index,
                                               totalLights: totalNumberOfLights) {
            totalNumberOfLights[index-1] = Light.Red
        }
        
        return totalNumberOfLights
    }
    
    private func oneMinuteLightRow(_ minutes: DigitalMinutes)-> [Light] {
        let numberOfYellowLights = minutes % LightRemainder.oneMinuteRemainder
        
        return totalLightsForARowContainingIlluminatedLights(totalNumberOfLightsInARow: NumberOfLightsInARow.oneMinuteRow,
                                                             numberOfIlluminatedLights: numberOfYellowLights,
                                                             illuminatedLight: .Yellow)
        
    }
    
    private func isThirdLightYellowInFiveMinuteLightRow(index: CurrentIndex,
                                                        totalLights: [Light])-> Bool {
        return index % LightRemainder.thirdLightInFiveMinuteRemainder == 0
        && totalLights[index-1] == .Yellow
    }
    
    private func totalLightsForARowContainingIlluminatedLights(totalNumberOfLightsInARow: NumberOfLights,
                                                               numberOfIlluminatedLights: NumberOfIlluminateLights,
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
