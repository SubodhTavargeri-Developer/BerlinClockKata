struct BerlinClockTime {
    let fiveHoursLights: [Light]
    let oneHoursLights: [Light]
    let fiveMinutesLights: [Light]
    let oneMinutesLights: [Light]
    let secondsLight: Light
}

enum Light {
    case Off
    case Red
    case Yellow
}
