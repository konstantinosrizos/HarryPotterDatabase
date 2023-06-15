import SwiftUI

struct CharactersListView: View {
    @ObservedObject var viewModel: CharactersListViewModel
    
    var body: some View {
        switch viewModel.state {
        case .loading:
            ProgressView()
                .onAppear {
                    Task {
                        await viewModel.fetchData()
                    }
                }
        case let .populated(data):
            List(data, id: \.self) { content in
                CellView(model: content)
            }
            .listStyle(.insetGrouped)
            .navigationTitle("Characters")
        case .error:
            ErrorView {
                Task {
                    await viewModel.fetchData()
                }
            } helpCenterButton: {
                guard let url = URL(string: Defaults.externalLink) else { return }
                viewModel.navigateTo(url: url)
            }
        }
    }
}

private extension CharactersListView {
    enum Defaults {
        static let externalLink = "https://www.google.com"
    }
}
