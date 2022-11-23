import UIKit

class BerlinViewController: UIViewController {

    private var presenter: BerlinClockPresenter?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        presenter?.loadPresenter()
    }
    
    func setupPresenter(presenter: BerlinClockPresenter) {
        self.presenter = presenter
    }

}

extension BerlinViewController: BerlinClockViewProtocol {
    
    func displayViewTitle(title: String) {
        self.title = title
    }
    
    func displayBerlinClockView(berlinClock: BerlinClockTime) {
        
    }
    
}
