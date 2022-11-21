
class Clock {
    
    private var seconds: Int = 0
    private var hours: Int = 5
    
    func setClockValues(seconds: Int) {
        self.seconds = seconds
    }
    
    func isSecondRowLightIlluminated()-> Lights {
        return seconds%2 == 0 ? .Yellow: .Off
    }
    
    func fiveHourLightRow()-> [Lights] {
        return [Lights.Red,Lights.Off,Lights.Off,Lights.Off]
    }
    
}
