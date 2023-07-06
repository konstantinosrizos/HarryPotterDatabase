import SnapshotTesting
import SwiftUI
import XCTest

@testable import HarryPotterDatabase

final class CharacterDetailsViewUITests: XCTestCase {
    
    override func setUpWithError() throws {
        try super.setUpWithError()
    }

    override func tearDown() {
        super.tearDown()
    }
    
    @MainActor // Need it to run the tests on the Main Thread
    func test_populatedState() async {
        // GIVEN
        let viewModel = CharacterDetailsViewModel(
            charactersEndpoint: .getCharacterDetails("9e3f7ce4-b9a7-4244-b709-dae5c1f1d4a8"),
            charactersRepository: MockCharactersRepository(
                fetchDataMockedResult: .success([.stub])
            )
        )
        
        let sut = CharacterDetailsView(viewModel: viewModel)
        let view = UIHostingController(rootView: sut) // UIKit view controller that manages SwiftUI view
        
        // WHEN
        await viewModel.fetchData()
        
        // THEN
        assertSnapshot(matching: view, as: .image(on: .iPhoneSe), named: "iPhoneSe")
        assertSnapshot(matching: view, as: .image(on: .iPhone13ProMax), named: "iPhone13ProMax")
    }
    
    @MainActor
    func test_ErrorState() async {
        // GIVEN
        let viewModel = CharacterDetailsViewModel(
            charactersEndpoint: .getCharacterDetails("9e3f7ce4-b9a7-4244-b709-dae5c1f1d4a8"),
            charactersRepository: MockCharactersRepository(
                fetchDataMockedResult: .failure(ApiError.decodingError)
            )
        )
        
        let sut = CharacterDetailsView(viewModel: viewModel)
        let view = UIHostingController(rootView: sut) // UIKit view controller that manages SwiftUI view
        
        // WHEN
        await viewModel.fetchData()
        
        // THEN
        assertSnapshot(matching: view, as: .image(on: .iPhoneSe), named: "iPhoneSe")
        assertSnapshot(matching: view, as: .image(on: .iPhone13ProMax), named: "iPhone13ProMax")
    }
}
