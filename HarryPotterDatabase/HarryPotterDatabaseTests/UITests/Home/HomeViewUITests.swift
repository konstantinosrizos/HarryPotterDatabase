import SnapshotTesting
import SwiftUI
import XCTest

@testable import HarryPotterDatabase

final class HomeViewUITests: XCTestCase {
    
    override func setUpWithError() throws {
        try super.setUpWithError()
    }

    override func tearDown() {
        super.tearDown()
    }
    
    func test_homeView() {
        // GIVEN
        let sut = HomeView()
        let view = UIHostingController(rootView: sut) // UIKit view controller that manages SwiftUI view
        
        // THEN
        assertSnapshot(matching: view, as: .image(on: .iPhoneSe), named: "iPhoneSe")
        assertSnapshot(matching: view, as: .image(on: .iPhone13ProMax), named: "iPhone13ProMax")
    }
}
