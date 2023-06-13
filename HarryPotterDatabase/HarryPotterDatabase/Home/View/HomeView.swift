import SwiftUI

struct HomeView: View {
    @ObservedObject var viewModel: HomeViewModel
    
    var body: some View {
        NavigationView {
            ZStack {
                Image("HPBackground")
                    .resizable()
                    .ignoresSafeArea()
                
                Image("HPHome")
                    .resizable()
                
                VStack(spacing: 20) {
                    Spacer()
                    NavigationLink {
                        CharactersListView(viewModel: .init(charactersEndpoint: .getCharacters))
                    } label: {
                        Text("Characters")
                            .frame(minWidth: 0, maxWidth: 200)
                            .padding(10)
                            .foregroundColor(Color("HPRed"))
                            .background(Color("HPYellow"))
                            .cornerRadius(40)
                            .font(.title.bold())
                    }
                    NavigationLink {
                        SpellsView(viewModel: .init())
                    } label: {
                        Text("Spells")
                            .frame(minWidth: 0, maxWidth: 200)
                            .padding(10)
                            .foregroundColor(Color("HPRed"))
                            .background(Color("HPYellow"))
                            .cornerRadius(40)
                            .font(.title.bold())
                    }
                    Spacer()
                        .frame(height: 20)
                }
            }
        }
    }
}

struct HomeViewView_Previews: PreviewProvider {
    static var previews: some View {
        HomeView(viewModel: .init())
    }
}
