import UIKit

class BerlinClockRouter: RouterProtocol {
    
    private let navigationController: UINavigationController
    
    init(navigationController: UINavigationController) {
        self.navigationController = navigationController
    }
    
    func routeToBerlinViewController() {
        let view = BerlinClockFactory.create(router: self)
        navigationController.setViewControllers([view], animated: true)
    }
}

