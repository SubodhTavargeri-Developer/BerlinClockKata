import UIKit

struct BerlinClockFactory {
    
    static func create(router: RouterProtocol) -> BerlinViewController {
        let clock = Clock()
        guard let view = UIStoryboard(name: "Main", bundle: .main).instantiateViewController(withIdentifier: "BerlinViewController") as? BerlinViewController else {
            fatalError("Unable to Instantiate TicTacToeViewController")
        }
        
        let presenter = BerlinClockPresenter(view: view, clock: clock)
        view.setupPresenter(presenter: presenter)
        return view
    }
}


