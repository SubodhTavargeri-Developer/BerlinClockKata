//  Created by Subodh Tavargeri
//  Set Router for BerlinViewController, helps in navigation

import UIKit

class BerlinClockRouter: RouterProtocol {
    
    private let navigationController: UINavigationController
    
    init(navigationController: UINavigationController) {
        self.navigationController = navigationController
    }
    
    func routeToBerlinViewController() {
        let view = BerlinClockFactory.create()
        navigationController.setViewControllers([view], animated: true)
    }
}

