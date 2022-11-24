protocol BerlinClockViewProtocol: AnyObject {
    func displayViewTitle(title: ViewTitle)
    func displayBerlinClockView(berlinClock: BerlinClockTime)
    func setTimePickerValues(timePickerModel: TimePickerModel)
}

typealias ViewTitle = String
