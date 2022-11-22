import XCTest
@testable import BerlinClockKata

class BerlinClockPresenterTests: XCTestCase {
    
    func test_ViewTitleIsDisplayed_WhenPresenterLoads() {
        let view = BerlinClockViewControllerSpy()
        let presenter = BerlinClockPresenter(view: view)
        
        presenter.loadPresenter()
        
        XCTAssertEqual(view.title, Constant.Title.screenTitle)
    }
}
