//  Created by Subodh Tavargeri on 25/11/22.
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
