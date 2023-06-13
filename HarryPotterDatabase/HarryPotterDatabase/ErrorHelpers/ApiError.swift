import Foundation

enum ApiError: Error {
    case invalidResponse
    case decodingError
    case badUrl
}

extension ApiError: LocalizedError {
    var errorDescription: String? {
        switch self {
        case .decodingError:
            return "Failed to decode the object from the service"
        case .invalidResponse:
            return "Invalid Response from the service"
        case .badUrl:
            return "Invalid URL"
        }
    }
}
