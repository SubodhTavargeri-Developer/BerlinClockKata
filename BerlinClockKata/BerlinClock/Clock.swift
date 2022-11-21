
class Clock {
    
    private var seconds: Int = 0
    private var hours: Int = 0
    private var minutes: Int = 0
    
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
    }
    
    func setClockValues(time: Time) {
        hours = time.hours
        minutes = time.minutes
        seconds = time.seconds
    }
    
    func secondLightRow()-> [Light] {
        return seconds%lightRemainder.secondRemainder == 0 ? [.Yellow]: [.Off]
    }
    
    func fiveHourLightRow()-> [Light] {
        let numberOfRedLights = hours/lightQuotient.fiveHourQuotient
        
        let totalNumberOfLights = calculateNumberOfLights(totalNumberOfLightsInARow: numberOfLightsInARow.fiveHourRow, numberOfIlluminatedLight: numberOfRedLights, illuminatedLight: .Red)
        
        return totalNumberOfLights
    }
    
    func oneHourLightRow()-> [Light] {
        let numberOfRedLights = hours%lightRemainder.oneHourRemainder
        
        let totalNumberOfLights = calculateNumberOfLights(totalNumberOfLightsInARow: numberOfLightsInARow.oneHourRow, numberOfIlluminatedLight: numberOfRedLights, illuminatedLight: .Red)
        
        return totalNumberOfLights
    }
    
    func fiveMinuteLightRow()-> [Light] {
        let numberOfIlluminatedLights = minutes/lightQuotient.fiveMinuteQuotient
        
        var totalNumberOfLights = calculateNumberOfLights(totalNumberOfLightsInARow: numberOfLightsInARow.fiveMinuteRow, numberOfIlluminatedLight: numberOfIlluminatedLights,illuminatedLight: .Yellow)
        
        for index in 1...totalNumberOfLights.count where isThirdLightYellowInFiveMinuteLightRow(index: index, totalLights: totalNumberOfLights) {
            totalNumberOfLights[index-1] = Light.Red
        }
        
        return totalNumberOfLights
    }
    
    func oneMinuteLightRow()-> [Light] {
        let numberOfYellowLights = minutes%lightRemainder.oneMinuteRemainder
        
        let totalNumberOfLights = calculateNumberOfLights(totalNumberOfLightsInARow: numberOfLightsInARow.oneMinuteRow, numberOfIlluminatedLight: numberOfYellowLights, illuminatedLight: .Yellow)
        
        return totalNumberOfLights
    }
    
    private func isThirdLightYellowInFiveMinuteLightRow(index: Int, totalLights: [Light])-> Bool {
        return index%3 == 0 && totalLights[index-1] == .Yellow
    }
    
    private func calculateNumberOfLights(totalNumberOfLightsInARow: Int,
                                         numberOfIlluminatedLight: Int,
                                         illuminatedLight: Light)-> [Light] {
        
        var totalNumberOfLights = [Light]()
        
        for _ in 0..<totalNumberOfLightsInARow {
            totalNumberOfLights.append(.Off)
        }
        
        for index in 0..<numberOfIlluminatedLight {
            totalNumberOfLights[index] = illuminatedLight
        }
    
        return totalNumberOfLights
    }
    
}
