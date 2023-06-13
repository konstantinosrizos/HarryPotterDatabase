import Foundation

protocol SpellsRepositoryProtocol {
    func fetchData(completion: @escaping (Result<[SpellsModel], Error>) -> Void) async throws -> Void
}

final class SpellsRepository: SpellsRepositoryProtocol {
    private let apiService: SpellsApiServiceProtocol
    
    init(apiService: SpellsApiServiceProtocol = SpellsApiService()) {
        self.apiService = apiService
    }
    
    func fetchData(completion: @escaping (Result<[SpellsModel], Error>) -> Void) async throws {
        do {
            try await apiService.fetchData(completion: completion)
        } catch {
            throw ApiError.decodingError
        }
    }
}
