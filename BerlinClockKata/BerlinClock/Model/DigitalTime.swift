//  Created by Subodh Tavargeri
//  DigitalTime Model which we receive as input from user

struct DigitalTime {
    let hours: DigitalHours
    let minutes: DigitalMinutes
    let seconds: DigitalSeconds
}

typealias DigitalHours = Int
typealias DigitalMinutes = Int
typealias DigitalSeconds = Int
