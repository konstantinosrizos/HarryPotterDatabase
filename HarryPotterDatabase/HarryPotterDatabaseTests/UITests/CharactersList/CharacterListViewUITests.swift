import SnapshotTesting
import SwiftUI
import XCTest

@testable import HarryPotterDatabase

final class CharacterListViewUITests: XCTestCase {
    
    override func setUpWithError() throws {
        try super.setUpWithError()
    }

    override func tearDown() {
        super.tearDown()
    }
    
    @MainActor // Need it to run the tests on the Main Thread
    func test_populatedState() async {
        // GIVEN
        let viewModel = CharactersListViewModel(
            charactersEndpoint: .getCharacters,
            charactersRepository: MockCharactersRepository(
                fetchDataMockedResult: .success([.stub])
            )
        )
        
        let sut = CharactersListView(viewModel: viewModel)
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
        let viewModel = CharactersListViewModel(
            charactersEndpoint: .getCharacters,
            charactersRepository: MockCharactersRepository(
                fetchDataMockedResult: .failure(ApiError.decodingError)
            )
        )
        
        let sut = CharactersListView(viewModel: viewModel)
        let view = UIHostingController(rootView: sut) // UIKit view controller that manages SwiftUI view
        
        // WHEN
        await viewModel.fetchData()
        
        // THEN
        assertSnapshot(matching: view, as: .image(on: .iPhoneSe), named: "iPhoneSe")
        assertSnapshot(matching: view, as: .image(on: .iPhone13ProMax), named: "iPhone13ProMax")
    }
}
