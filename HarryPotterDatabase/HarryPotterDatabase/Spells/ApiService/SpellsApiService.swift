import Foundation

protocol SpellsApiServiceProtocol {
    func fetchData(completion: @escaping (Result<[SpellsModel], Error>) -> Void) async throws -> Void
}

final class SpellsApiService: SpellsApiServiceProtocol {
    func fetchData(completion: @escaping (Result<[SpellsModel], Error>) -> Void) async throws {
        guard let url = URL(string: "https://hp-api.onrender.com/api/spells") else {
            completion(.failure(ApiError.badUrl))
            throw ApiError.badUrl
        }
        
        let (data, response) = try await URLSession.shared.data(from: url)
        
        guard let httpResponse = response as? HTTPURLResponse, httpResponse.statusCode == 200 else {
            completion(.failure(ApiError.invalidResponse))
            throw ApiError.invalidResponse
        }
        
        do {
            let decoder = JSONDecoder()
            decoder.keyDecodingStrategy = .convertFromSnakeCase // Handles properties from some_property > someProperty
            let result = try decoder.decode([SpellsModel].self, from: data)
            completion(.success(result))
        } catch {
            completion(.failure(ApiError.decodingError))
            throw ApiError.decodingError
        }
    }
}
