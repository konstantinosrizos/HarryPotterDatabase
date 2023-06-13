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
                //
            }
        }
    }
}

//struct CharactersView_Previews: PreviewProvider {
//    static var previews: some View {
//        CharactersView(viewModel: .init())
//    }
//}
