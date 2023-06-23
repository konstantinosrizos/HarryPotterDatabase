import Foundation

@testable import HarryPotterDatabase

final class MockCharactersRepository: CharactersRepositoryProtocol {
    private let fetchDataMockedResult: Result<[CharactersModel], Error>
    
    init(fetchDataMockedResult: Result<[CharactersModel], Error>) {
        self.fetchDataMockedResult = fetchDataMockedResult
    }
    
    func fetchData(from endpoint: CharactersAPI, completion: @escaping (Result<[CharactersModel], Error>) -> Void) async throws {
        completion(fetchDataMockedResult)
    }
}
