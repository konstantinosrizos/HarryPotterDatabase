import Foundation

@testable import HarryPotterDatabase

final class MockCharactersRepository: CharactersRepositoryProtocol {
    private let fetchDataMockedResult: Result<[CharactersModel], Error>
    private let fetchDataEndPoint: CharactersAPI
    
    init(fetchDataMockedResult: Result<[CharactersModel], Error>, fetchDataEndPoint: CharactersAPI) {
        self.fetchDataMockedResult = fetchDataMockedResult
        self.fetchDataEndPoint = fetchDataEndPoint
    }
    
    func fetchData(from endpoint: CharactersAPI, completion: @escaping (Result<[CharactersModel], Error>) -> Void) async throws {
        completion(fetchDataMockedResult)
    }
}
