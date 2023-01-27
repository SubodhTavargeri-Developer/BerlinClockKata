//  Created by Subodh Tavargeri
//  BerlinClockTime Model displayed on UI to user

struct BerlinClockTime {
    let secondsLight: Light
    let fiveHoursLights: [Light]
    let oneHoursLights: [Light]
    let fiveMinutesLights: [Light]
    let oneMinutesLights: [Light]
}

enum Light {
    case Off
    case Red
    case Yellow
}
