class BerlinClockPresenter {
    
    private weak var view: BerlinClockViewProtocol?
    
    init(view: BerlinClockViewProtocol) {
        self.view = view
    }
    
    func loadPresenter() {
        displayViewTitle()
    }
    
    private func displayViewTitle() {
        view?.displayViewTitle(title: Constant.Title.screenTitle)
    }
}
