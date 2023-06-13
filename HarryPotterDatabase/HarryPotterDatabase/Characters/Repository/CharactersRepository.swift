import Foundation

protocol CharactersRepositoryProtocol {
    func fetchData(from endpoint: CharactersAPI, completion: @escaping (Result<[CharactersModel], Error>) -> Void) async throws -> Void
}

final class CharactersRepository: CharactersRepositoryProtocol {
    private let apiService: CharactersApiServiceProtocol
    
    init(apiService: CharactersApiServiceProtocol = CharactersApiService()) {
        self.apiService = apiService
    }
    
    func fetchData(from endpoint: CharactersAPI, completion: @escaping (Result<[CharactersModel], Error>) -> Void) async throws {
        do {
            try await apiService.fetchData(from: endpoint, completion: completion)
        } catch {
            throw ApiError.decodingError
        }
    }
}
