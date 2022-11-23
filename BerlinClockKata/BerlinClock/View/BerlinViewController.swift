import UIKit

class BerlinViewController: UIViewController {
    
    private var presenter: BerlinClockPresenter?
    private var hours = 0
    private var minutes = 0
    private var seconds = 0
    
    @IBOutlet weak var stackViewSeconds: UIStackView!
    @IBOutlet weak var stackViewFiveHour: UIStackView!
    @IBOutlet weak var stackViewOneHour: UIStackView!
    @IBOutlet weak var stackViewFiveMinute: UIStackView!
    @IBOutlet weak var stackViewOneMinute: UIStackView!
    
    @IBOutlet private weak var textFieldTime: UITextField!
    @IBOutlet private weak var toolBarDone: UIToolbar!
    @IBOutlet private weak var pickerTime: UIPickerView!
    
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
        textFieldTime.resignFirstResponder()
    }
}

extension BerlinViewController: BerlinClockViewProtocol {
    
    func displayViewTitle(title: String) {
        self.title = title
    }
    
    func displayBerlinClockView(berlinClock: BerlinClockTime) {
        
    }
    
}

extension BerlinViewController: UIPickerViewDelegate, UIPickerViewDataSource {
    
    func numberOfComponents(in pickerView: UIPickerView) -> Int {
        return 3
    }
    
    func pickerView(_ pickerView: UIPickerView, numberOfRowsInComponent component: Int) -> Int {
        switch component {
        case 0:
            return 24
        case 1,2:
            return 60
            
        default:
            return 0
        }
    }
    
    func pickerView(_ pickerView: UIPickerView, widthForComponent component: Int) -> CGFloat {
        return pickerView.frame.size.width/3
    }
    
    func pickerView(_ pickerView: UIPickerView, titleForRow row: Int, forComponent component: Int) -> String? {
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
    
    func pickerView(_ pickerView: UIPickerView, didSelectRow row: Int, inComponent component: Int) {
        switch component {
        case 0:
            hours = row
        case 1:
            minutes = row
        case 2:
            seconds = row
        default:
            break;
        }
        
        textFieldTime.text = ("\(hours):\(minutes):\(seconds)")
    }
}
