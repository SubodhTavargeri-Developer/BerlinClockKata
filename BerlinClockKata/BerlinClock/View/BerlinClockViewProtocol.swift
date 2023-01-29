//  Created by Subodh Tavargeri on 26/11/22.
//  Protocol representation for View

protocol BerlinClockViewProtocol: AnyObject {
    func displayViewTitle(title: ViewTitle)
    func displayBerlinClockView(berlinClock: BerlinClockTime)
    func setTimePickerValues(timePickerModel: TimePickerModel)
}

typealias ViewTitle = String
