import Foundation

protocol CharactersApiServiceProtocol {
    func fetchData(from endpoint: CharactersAPI, completion: @escaping (Result<[CharactersModel], Error>) -> Void) async throws -> Void
}

final class CharactersApiService: CharactersApiServiceProtocol {
    func fetchData(from endpoint: CharactersAPI, completion: @escaping (Result<[CharactersModel], Error>) -> Void) async throws {
        guard let url = URL(string: endpoint.urlBuilder) else {
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
            let result = try decoder.decode([CharactersModel].self, from: data)
            completion(.success(result))
        } catch {
            completion(.failure(ApiError.decodingError))
            throw ApiError.decodingError
        }
    }
}
