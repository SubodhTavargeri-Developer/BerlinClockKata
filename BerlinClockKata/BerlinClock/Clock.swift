
class Clock {
    
    private var seconds: Int = 0
    private var hours: Int = 5
    
    private struct numberOfLightsInARow {
        static let fiveHourRow = 4
        static let oneHourRow = 4
    }
    
    func setClockValues(hours: Int, seconds: Int) {
        self.seconds = seconds
        self.hours = hours
    }
    
    func isSecondRowLightIlluminated()-> Lights {
        return seconds%2 == 0 ? .Yellow: .Off
    }
    
    func fiveHourLightRow()-> [Lights] {
        let numberOfRedLights = hours/5
        
        let totalNumberOfLights = calculateNumberOfLights(totalNumberOfLightsInARow: numberOfLightsInARow.fiveHourRow, numberOfIlluminatedLight: numberOfRedLights)
        
        return totalNumberOfLights
    }
    
    func oneHourLightRow()-> [Lights] {
        let numberOfRedLights = hours%5
        
        let totalNumberOfLights = calculateNumberOfLights(totalNumberOfLightsInARow: numberOfLightsInARow.oneHourRow, numberOfIlluminatedLight: numberOfRedLights)
        
        return totalNumberOfLights
    }
    
    func fiveMinuteLightRow()-> [Lights] {
        return [Lights.Yellow,Lights.Off,Lights.Off,Lights.Off,Lights.Off,Lights.Off
                ,Lights.Off,Lights.Off,Lights.Off,Lights.Off,Lights.Off]
    }
    
    private func calculateNumberOfLights(totalNumberOfLightsInARow: Int,
                                         numberOfIlluminatedLight: Int)-> [Lights] {
        var totalNumberOfLights = [Lights]()
        
        for _ in 0..<totalNumberOfLightsInARow {
            totalNumberOfLights.append(.Off)
        }
        
        for index in 0..<numberOfIlluminatedLight {
            totalNumberOfLights[index] = Lights.Red
        }
        
        return totalNumberOfLights
    }
    
}
