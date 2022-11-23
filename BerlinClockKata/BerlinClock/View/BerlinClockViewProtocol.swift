protocol BerlinClockViewProtocol: AnyObject {
    func displayViewTitle(title: String)
    func displayBerlinClockView(berlinClock: BerlinClockTime)
    func timePickerValues(timePickerModel: TimePickerModel)
}
