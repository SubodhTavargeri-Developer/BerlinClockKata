import UIKit

class BerlinViewController: UIViewController {

    private var presenter: BerlinClockPresenter?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }
    
    func setupPresenter(presenter: BerlinClockPresenter) {
        self.presenter = presenter
    }

}

extension BerlinViewController: BerlinClockViewProtocol {
    
    func displayViewTitle(title: String) {
        
    }
    
    func displayBerlinClockView(berlinClock: BerlinClockTime) {
        
    }
    
}
