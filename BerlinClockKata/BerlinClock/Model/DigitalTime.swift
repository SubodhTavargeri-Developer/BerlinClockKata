//  Created by Subodh Tavargeri on 25/11/22.
//  DigitalTime Model which we receive as input from user

struct DigitalTime {
    let hours: DigitalHours
    let minutes: DigitalMinutes
    let seconds: DigitalSeconds
}

typealias DigitalHours = Int
typealias DigitalMinutes = Int
typealias DigitalSeconds = Int
