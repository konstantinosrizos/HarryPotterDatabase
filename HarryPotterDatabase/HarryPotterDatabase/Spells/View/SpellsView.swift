import SwiftUI

struct SpellsView: View {
    @ObservedObject var viewModel: SpellsViewModel
    
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
                VStack(alignment: .leading) {
                    HStack(spacing: 4) {
                        Image("SpellIcon")
                            .resizable()
                            .aspectRatio(contentMode: .fill)
                            .clipShape(Circle())
                            .frame(width: 24, height: 24)
                        Text(content.name)
                            .bold()
                            .font(.title3)
                    }
                    Text(content.description)
                        .font(.body)
                }
            }
            .navigationTitle("Spells")
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

struct SpellsView_Previews: PreviewProvider {
    static var previews: some View {
        SpellsView(viewModel: .init())
    }
}
