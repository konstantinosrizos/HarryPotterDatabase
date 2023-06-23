import XCTest

@testable import HarryPotterDatabase

final class SpellsViewModelTests: XCTestCase {
    private var sut: SpellsViewModel!
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
        sut = SpellsViewModel(spellsRepository: MockSpellsRepository(fetchDataMockedResult: .success([.stub])))
        
        // WHEN
        await sut.fetchData()

        // THEN
        XCTAssertEqual(sut.state, .populated([.stub]))
    }
    
    func test_FetchDataError() async {
        // GIVEN
        sut = SpellsViewModel(spellsRepository: MockSpellsRepository(fetchDataMockedResult: .failure(ApiError.decodingError)))
        
        // WHEN
        await sut.fetchData()
        
        // THEN
        XCTAssertEqual(sut.state, .error)
    }
    
    func test_NavigateTo() {
        // GIVEN
        let dummyUrl = URL(string: "https://www.google.com")!
        sut = SpellsViewModel(
            spellsRepository: MockSpellsRepository(fetchDataMockedResult: .success([.stub])),
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

extension SpellsViewModel.State: Equatable {
    public static func == (lhs: SpellsViewModel.State, rhs: SpellsViewModel.State) -> Bool {
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
