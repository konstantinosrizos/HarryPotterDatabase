import Foundation

final class CharacterDetailsViewModel: ObservableObject {
    @Published private(set) var state: State = .loading
    
    private let charactersEndpoint: CharactersAPI
    private let charactersRepository: CharactersRepositoryProtocol
    private let applicationShared: ApplicationSharedProtocol
    
    init(
        charactersEndpoint: CharactersAPI,
        charactersRepository: CharactersRepositoryProtocol = CharactersRepository(),
        applicationShared: ApplicationSharedProtocol = ApplicationShared()
    ) {
        self.charactersEndpoint = charactersEndpoint
        self.charactersRepository = charactersRepository
        self.applicationShared = applicationShared
    }
    
    @MainActor
    func fetchData() async {
        do {
            try await charactersRepository.fetchData(from: charactersEndpoint, completion: { [weak self] result in
                DispatchQueue.main.async {// <- We need that cos the data comes from an escaping closure. We need them on the Main Thread
                    switch result {
                    case let .success(model):
                        self?.state = .populated(model)
                    case .failure(_):
                        self?.state = .error
                    }
                }
            })
        } catch {
            state = .error
        }
    }
    
    func navigateTo(url: URL) {
        applicationShared.openUrl(url: url)
    }
}

extension CharacterDetailsViewModel {
    enum State {
        case loading
        case populated([CharactersModel])
        case error
    }
}
