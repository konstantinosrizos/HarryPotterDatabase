import Foundation

final class SpellsViewModel: ObservableObject {
    @Published private(set) var state: State = .loading
    
    private let spellsRepository: SpellsRepositoryProtocol
    
    init(spellsRepository: SpellsRepositoryProtocol = SpellsRepository()) {
        self.spellsRepository = spellsRepository
    }
    
    @MainActor
    func fetchData() async {
        do {
            try await spellsRepository.fetchData(completion: { [weak self] result in
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
}

extension SpellsViewModel {
    enum State {
        case loading
        case populated([SpellsModel])
        case error
    }
}
