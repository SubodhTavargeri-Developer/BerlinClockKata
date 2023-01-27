//  Created by Subodh Tavargeri
//  BerlinClockTime Model displayed on UI to user

struct TimePickerModel {
    let hoursEndValue: TimePickerHourUpperLimit
    let minutesEndValue: TimePickerMinutesUpperLimit
    let secondsEndValue: TimePickerSecondsUpperLimit
}

typealias TimePickerHourUpperLimit = Int
typealias TimePickerMinutesUpperLimit = Int
typealias TimePickerSecondsUpperLimit = Int
