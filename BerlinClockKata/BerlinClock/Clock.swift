
class Clock {
    
    private var seconds: Int = 2
    
    func isSecondLightIlluminated()-> Bool {
        return seconds%2 == 0
    }
}
