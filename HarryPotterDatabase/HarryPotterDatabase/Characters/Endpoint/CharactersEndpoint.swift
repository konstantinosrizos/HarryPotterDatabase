import Foundation

protocol APIBuilder {
    var urlBuilder: String { get }
    var baseURL: URL { get }
    var path: String { get }
}

enum CharactersAPI {
    case getCharacters
    case getCharacterDetails(String)
}

extension CharactersAPI: APIBuilder {
    var baseURL: URL {
        return URL(string: "https://hp-api.onrender.com/api")!
    }
    
    var path: String {
        switch self {
        case .getCharacters:
            return "/characters"
        case let .getCharacterDetails(id):
            return "/character/\(id)"
        }
    }
    
    var urlBuilder: String {
        return "\(self.baseURL.appendingPathComponent(self.path))"
    }
}
