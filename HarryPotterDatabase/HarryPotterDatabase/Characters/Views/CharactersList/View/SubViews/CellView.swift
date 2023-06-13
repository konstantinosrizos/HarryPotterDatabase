import SwiftUI

struct CellView: View {

    let model: CharactersModel

    var body: some View {
        HStack {
            AsyncImage(url: URL(string: model.image)) { image in
                image
                    .resizable()
                    .aspectRatio(contentMode: .fill)
                    .clipShape(Circle())
            } placeholder: {
                Image("HPDefault")
                    .resizable()
                    .aspectRatio(contentMode: .fill)
                    .clipShape(Circle())
            }
            .frame(width: 80, height: 80)
            
            VStack(alignment: .leading) {
                Text(model.name)
                    .bold()
                    .font(.title3)
                
                Text(model.house)
                    .font(.body)
            }
            
            NavigationLink {
                CharacterDetailsView(viewModel: .init(charactersEndpoint: .getCharacterDetails(model.id)))
            } label: {
                EmptyView()
            }
        }
    }
}
