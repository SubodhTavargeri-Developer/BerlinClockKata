//  Created by Subodh Tavargeri on 25/11/22.
//  BerlinClockTime Model displayed on UI to user

struct TimePickerModel {
    let hoursEndValue: TimePickerHourUpperLimit
    let minutesEndValue: TimePickerMinutesUpperLimit
    let secondsEndValue: TimePickerSecondsUpperLimit
}

typealias TimePickerHourUpperLimit = Int
typealias TimePickerMinutesUpperLimit = Int
typealias TimePickerSecondsUpperLimit = Int
