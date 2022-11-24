import UIKit

class BerlinViewController: UIViewController {
    
    private var presenter: BerlinClockPresenter?
    private var userSelectedHours = 0
    private var userSelectedMinutes = 0
    private var userSelectedSeconds = 0
    private var timePickerModel: TimePickerModel?
 
    @IBOutlet private weak var stackViewSeconds: UIStackView!
    @IBOutlet private weak var stackViewFiveHour: UIStackView!
    @IBOutlet private weak var stackViewOneHour: UIStackView!
    @IBOutlet private weak var stackViewFiveMinute: UIStackView!
    @IBOutlet private weak var stackViewOneMinute: UIStackView!
    
    @IBOutlet private weak var textFieldTime: UITextField!
    @IBOutlet private weak var toolBarDone: UIToolbar!
    @IBOutlet private weak var pickerTime: UIPickerView!
    
    private typealias AccessibilityIdentifier = String
    
    override func viewDidLoad() {
        super.viewDidLoad()
        presenter?.loadPresenter()
        setupView()
    }
    
    func setupPresenter(presenter: BerlinClockPresenter) {
        self.presenter = presenter
    }
    
    private func setupView() {
        textFieldTime.inputView = pickerTime
        textFieldTime.inputAccessoryView = toolBarDone
    }
    
    @IBAction private func doneToolBarButtonPressed(_ sender: Any) {
        setTextFieldValue()
        textFieldTime.resignFirstResponder()
        removeLightViewInsideBerlinClockView()
        digitalToBerLinClock()
    }
    
    private func digitalToBerLinClock() {
        let digitalTime = DigitalTime(hours: userSelectedHours,
                                      minutes: userSelectedMinutes,
                                      seconds: userSelectedSeconds)
        presenter?.handleTimeButtonAction(digitalTime: digitalTime)
    }
    private func setTextFieldValue() {
        textFieldTime.text = ("\(userSelectedHours):\(userSelectedMinutes):\(userSelectedSeconds)")
    }
    
    private func removeLightViewInsideBerlinClockView() {
        removeSubViewsInsideStackView(stackViewSeconds)
        removeSubViewsInsideStackView(stackViewFiveHour)
        removeSubViewsInsideStackView(stackViewOneHour)
        removeSubViewsInsideStackView(stackViewFiveMinute)
        removeSubViewsInsideStackView(stackViewOneMinute)
    }
    
    private func removeSubViewsInsideStackView(_ stackview: UIStackView) {
        stackview.arrangedSubviews.forEach{$0.removeFromSuperview()}
    }
    
    private func addLightViewsIntoStackView(_ stackview: UIStackView,
                                            lights: [Light]) {
        for index in 0..<lights.count {
            let light = lights[index]
            let view = BerlinClockLight()
            view.accessibilityIdentifier = viewAccessibilityIdentifier(viewIdentifier:
                                                                        stackview.accessibilityIdentifier ?? "",
                                                                       index: index)
            view.backgroundColor = light.getColor()
            stackview.addArrangedSubview(view)
        }
    }
    
    private func viewAccessibilityIdentifier(viewIdentifier: AccessibilityIdentifier,
                                             index: Int) -> AccessibilityIdentifier {
        "\(viewIdentifier)\(index)"
    }
}

extension BerlinViewController: BerlinClockViewProtocol {
    
    func updateTimePickerValues(timePickerModel: TimePickerModel) {
        self.timePickerModel = timePickerModel
    }
    
    func displayViewTitle(title: String) {
        self.title = title
    }
    
    func displayBerlinClockView(berlinClock: BerlinClockTime) {
        addLightViewsIntoStackView(stackViewSeconds,
                                   lights: [berlinClock.secondsLight])
        addLightViewsIntoStackView(stackViewFiveHour,
                                   lights: berlinClock.fiveHoursLights)
        addLightViewsIntoStackView(stackViewOneHour,
                                   lights: berlinClock.oneHoursLights)
        addLightViewsIntoStackView(stackViewFiveMinute,
                                   lights: berlinClock.fiveMinutesLights)
        addLightViewsIntoStackView(stackViewOneMinute,
                                   lights: berlinClock.oneMinutesLights)
    }
}

extension BerlinViewController: UIPickerViewDataSource, UIPickerViewDelegate {
    
    func numberOfComponents(in pickerView: UIPickerView) -> Int {
        return Constant.TotalNumberOfComponents
    }
    
    func pickerView(_ pickerView: UIPickerView,
                    numberOfRowsInComponent component: Int) -> Int {
        switch component {
        case 0:
            return timePickerModel?.hoursEndValue ?? 0
        case 1:
            return timePickerModel?.minutesEndValue ?? 0
        case 2:
            return timePickerModel?.secondsEndValue ?? 0
        default:
            return 0
        }
    }
    
    func pickerView(_ pickerView: UIPickerView,
                    widthForComponent component: Int) -> CGFloat {
        return pickerView.frame.size.width/3
    }
    
    func pickerView(_ pickerView: UIPickerView,
                    titleForRow row: Int,
                    forComponent component: Int) -> String? {
        switch component {
        case 0:
            return "\(row) Hour"
        case 1:
            return "\(row) Minute"
        case 2:
            return "\(row) Second"
        default:
            return ""
        }
    }
    
    func pickerView(_ pickerView: UIPickerView,
                    didSelectRow row: Int,
                    inComponent component: Int) {
        switch component {
        case 0:
            userSelectedHours = row
        case 1:
            userSelectedMinutes = row
        case 2:
            userSelectedSeconds = row
        default:
            break;
        }
        setTextFieldValue()
    }
}

private extension Light {
    func getColor() -> UIColor {
        switch self {
        case .Off:
            return .white
        case .Red:
            return .red
        case .Yellow:
            return .yellow
        }
    }
}
