
class Clock {
    
    private var seconds: Int = 0
    
    func setClockValues(seconds: Int) {
        self.seconds = seconds
    }
    
    func isSecondRowLightIlluminated()-> Lights {
        return seconds%2 == 0 ? .Yellow: .Off
    }
}
