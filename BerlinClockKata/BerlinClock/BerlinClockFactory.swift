//  Created by Subodh Tavargeri on 24/11/22.
//  Set BerliViewControleer with presenter and clock

import UIKit

struct BerlinClockFactory {
    
    ///  Setup BerlinViewController with presenter and view
    /// - Returns: BerlinViewController
    static func create() -> BerlinViewController {
        let clock = Clock()
        guard let view = UIStoryboard(name: "Main", bundle: .main).instantiateViewController(withIdentifier: "BerlinViewController") as? BerlinViewController else {
            fatalError("Unable to Instantiate BerlinViewController")
        }
        
        let presenter = BerlinClockPresenter(view: view, clock: clock)
        view.setupPresenter(presenter: presenter)
        return view
    }
}


