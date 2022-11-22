@testable import BerlinClockKata

class BerlinClockTimeBuilder {
    
    private var fiveHourLights: [Light] = [.Red,.Red,.Red,.Off]
    private var oneHourLights: [Light] = [.Red,.Red,.Red,.Off]
    private var fiveMinuteLights: [Light] = [.Yellow,.Yellow,.Red,.Yellow,.Yellow,.Red,.Yellow,.Red,.Red,
                                             .Yellow,.Yellow]
    private var oneMinuteLights: [Light] = [.Yellow,.Yellow,.Yellow,.Yellow]
    private var secondLight: Light = .Yellow
    
    func withFiveHourLights(_ lights: [Light]) -> Self {
        fiveHourLights = lights
        return self
    }
    
    func withoneHoursLights(_ lights: [Light]) -> Self {
        oneHourLights = lights
        return self
    }
    
    func withfiveMinutesLights(_ lights: [Light]) -> Self {
        fiveMinuteLights = lights
        return self
    }
    
    func withoneMinuteLights(_ lights: [Light]) -> Self {
        oneMinuteLights = lights
        return self
    }
    func withsecondLight(_ light: Light) -> Self {
        secondLight = light
        return self
    }
    
    func build() -> BerlinClockTime {
        return BerlinClockTime(secondsLight: secondLight,
                               fiveHoursLights: fiveHourLights,
                               oneHoursLights: oneHourLights,
                               fiveMinutesLights: fiveMinuteLights,
                               oneMinutesLights: oneMinuteLights)
    }
}
