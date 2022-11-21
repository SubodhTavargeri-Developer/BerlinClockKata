
class Clock {
    
    private var seconds: Int = 0
    private var hours: Int = 5
    
    func setClockValues(hours: Int, seconds: Int) {
        self.seconds = seconds
        self.hours = hours
    }
    
    func isSecondRowLightIlluminated()-> Lights {
        return seconds%2 == 0 ? .Yellow: .Off
    }
    
    func fiveHourLightRow()-> [Lights] {
        let numberOfRedLights = hours/5
        
        let totalNumberOfLights = calculateTotalNumberOfIlluminatedLights(totalNumberOfLightsInARow: 4, numberOfIlluminatedLight: numberOfRedLights)
        
        return totalNumberOfLights
    }
    
    func oneHourLightRow()-> [Lights] {
        let numberOfRedLights = hours%5
        
        let totalNumberOfLights = calculateTotalNumberOfIlluminatedLights(totalNumberOfLightsInARow: 4, numberOfIlluminatedLight: numberOfRedLights)
        
        return totalNumberOfLights
    }
    
    private func calculateTotalNumberOfIlluminatedLights(totalNumberOfLightsInARow: Int,
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
