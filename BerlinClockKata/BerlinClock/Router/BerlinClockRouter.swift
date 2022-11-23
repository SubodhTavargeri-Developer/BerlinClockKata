import UIKit

class BerlinClockRouter: RouterProtocol {
    
    private let navigationController: UINavigationController
    
    init(navigationController: UINavigationController) {
        self.navigationController = navigationController
    }
    
    func routeToBerlinViewController() {
        guard let view = UIStoryboard(name: "Main", bundle: .main).instantiateViewController(withIdentifier: "BerlinViewController") as? BerlinViewController else {
            fatalError("Unable to Instantiate TicTacToeViewController")
        }
        navigationController.setViewControllers([view], animated: true)
    }
}

