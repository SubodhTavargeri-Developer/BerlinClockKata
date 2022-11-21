
class Clock {
    
    private var seconds: Int = 0
    private var hours: Int = 0
    private var minutes: Int = 0
    
    private struct numberOfLightsInARow {
        static let fiveHourRow = 4
        static let oneHourRow = 4
        static let fiveMinuteRow = 11
    }
    
    func setClockValues(hours: Int, minutes: Int, seconds: Int) {
        self.seconds = seconds
        self.hours = hours
        self.minutes = minutes
    }
    
    func isSecondRowLightIlluminated()-> Lights {
        return seconds%2 == 0 ? .Yellow: .Off
    }
    
    func fiveHourLightRow()-> [Lights] {
        let numberOfRedLights = hours/5
        
        let totalNumberOfLights = calculateNumberOfLights(totalNumberOfLightsInARow: numberOfLightsInARow.fiveHourRow, numberOfIlluminatedLight: numberOfRedLights, illuminatedLight: .Red)
        
        return totalNumberOfLights
    }
    
    func oneHourLightRow()-> [Lights] {
        let numberOfRedLights = hours%5
        
        let totalNumberOfLights = calculateNumberOfLights(totalNumberOfLightsInARow: numberOfLightsInARow.oneHourRow, numberOfIlluminatedLight: numberOfRedLights, illuminatedLight: .Red)
        
        return totalNumberOfLights
    }
    
    func fiveMinuteLightRow()-> [Lights] {
        let numberOfIlluminatedLights = minutes/5
        
        var totalNumberOfLights = calculateNumberOfLights(totalNumberOfLightsInARow: numberOfLightsInARow.fiveMinuteRow, numberOfIlluminatedLight: numberOfIlluminatedLights,illuminatedLight: .Yellow)
        
        for index in 1...totalNumberOfLights.count where isThirdLightYellowInFiveMinuteLightRow(index: index, totalLights: totalNumberOfLights) {
            totalNumberOfLights[index-1] = Lights.Red
        }
        
        return  totalNumberOfLights
    }
    
    private func isThirdLightYellowInFiveMinuteLightRow(index: Int, totalLights: [Lights])-> Bool {
        return index%3 == 0 && totalLights[index-1] == .Yellow
    }
    
    private func calculateNumberOfLights(totalNumberOfLightsInARow: Int,
                                         numberOfIlluminatedLight: Int,
                                         illuminatedLight: Lights)-> [Lights] {
        var totalNumberOfLights = [Lights]()
        
        for _ in 0..<totalNumberOfLightsInARow {
            totalNumberOfLights.append(.Off)
        }
        
        for index in 0..<numberOfIlluminatedLight {
            totalNumberOfLights[index] = illuminatedLight
        }
        
        return totalNumberOfLights
    }
    
}
