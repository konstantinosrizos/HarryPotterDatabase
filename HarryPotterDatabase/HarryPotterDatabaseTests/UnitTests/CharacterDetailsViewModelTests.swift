import XCTest

@testable import HarryPotterDatabase

final class CharacterDetailsViewModelTests: XCTestCase {
    private var sut: CharacterDetailsViewModel!
    private var urlFuncTest: URL!
    
    override func setUp() {
        super.setUp()
    }
    
    override func tearDown() {
        sut = nil
        urlFuncTest = nil
        
        super.tearDown()
    }
    
    func test_FetchDataSuccess() async {
        // GIVEN
        sut = CharacterDetailsViewModel(
            charactersEndpoint: .getCharacterDetails("9e3f7ce4-b9a7-4244-b709-dae5c1f1d4a8"),
            charactersRepository: MockCharactersRepository(fetchDataMockedResult: .success([.stub]))
        )
        
        // WHEN
        await sut.fetchData()
        
        // THEN
        XCTAssertEqual(sut.state, .populated([.stub]))
    }
    
    func test_FetchDataError() async {
        // GIVEN
        sut = CharacterDetailsViewModel(
            charactersEndpoint: .getCharacterDetails("9e3f7ce4-b9a7-4244-b709-dae5c1f1d4a8"),
            charactersRepository: MockCharactersRepository(fetchDataMockedResult: .failure(ApiError.decodingError))
        )
        
        // WHEN
        await sut.fetchData()
        
        // THEN
        XCTAssertEqual(sut.state, .error)
    }
    
    func test_NavigateTo() {
        // GIVEN
        let dummyUrl = URL(string: "https://www.google.com")!
        sut = CharacterDetailsViewModel(
            charactersEndpoint: .getCharacterDetails("9e3f7ce4-b9a7-4244-b709-dae5c1f1d4a8"),
            charactersRepository: MockCharactersRepository(fetchDataMockedResult: .failure(ApiError.decodingError)),
            applicationShared: MockApplicationShared(testUrl: { url in
                self.urlFuncTest = url
            })
        )
        
        // WHEN
        sut.navigateTo(url: dummyUrl)
        
        // THEN
        XCTAssertEqual(urlFuncTest, dummyUrl)
    }
}

extension CharacterDetailsViewModel.State: Equatable {
    public static func == (lhs: CharacterDetailsViewModel.State, rhs: CharacterDetailsViewModel.State) -> Bool {
        switch (lhs, rhs) {
        case (.loading, .loading):
            return true
        case (.error, .error):
            return true
        case (.populated(let lhsModel), .populated(let rhsModel)):
            return lhsModel == rhsModel
        default:
            return false
        }
    }
}
