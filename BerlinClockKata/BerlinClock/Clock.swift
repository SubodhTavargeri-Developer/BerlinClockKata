
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
        var totalNumberOfLights = [Lights.Off,Lights.Off,Lights.Off,Lights.Off]
        
        for index in 0..<numberOfRedLights {
            totalNumberOfLights[index] = Lights.Red
        }
        
        return totalNumberOfLights
    }
    
    func oneHourLightRow()-> [Lights] {
        let numberOfRedLights = hours%5
        var totalNumberOfLights = [Lights.Off,Lights.Off,Lights.Off,Lights.Off]
        
        for index in 0..<numberOfRedLights {
            totalNumberOfLights[index] = Lights.Red
        }
        
        return totalNumberOfLights
    }
    
}
