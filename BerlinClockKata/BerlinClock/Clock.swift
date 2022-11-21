
class Clock {
    
    private var seconds: Int = 0
    
    func setClockValues(seconds: Int) {
        self.seconds = seconds
    }
    
    func isSecondLightIlluminated()-> Bool {
        return seconds%2 == 0
    }
}
