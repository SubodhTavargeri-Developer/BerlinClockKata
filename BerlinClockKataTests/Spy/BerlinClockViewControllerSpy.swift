@testable import BerlinClockKata

class BerlinClockViewControllerSpy: BerlinClockViewProtocol {
    
    var title: String?
    
    func displayViewTitle(title: String) {
        self.title = title
    }
    
    
}
