protocol BerlinClockViewProtocol: AnyObject {
    func displayViewTitle(title: String)
    func displayBerlinClockView(berlinClock: BerlinClockTime)
    func setTimePickerValues(timePickerModel: TimePickerModel)
}
