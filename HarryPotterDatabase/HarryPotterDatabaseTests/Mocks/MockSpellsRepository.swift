import Foundation

@testable import HarryPotterDatabase

final class MockSpellsRepository: SpellsRepositoryProtocol {
    private let fetchDataMockedResult: Result<[SpellsModel], Error>
    
    init(fetchDataMockedResult: Result<[SpellsModel], Error>) {
        self.fetchDataMockedResult = fetchDataMockedResult
    }
    
    func fetchData(completion: @escaping (Result<[SpellsModel], Error>) -> Void) async throws {
        completion(fetchDataMockedResult)
    }
}
