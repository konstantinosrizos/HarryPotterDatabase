import SwiftUI

struct CharacterDetailsView: View {
    @ObservedObject var viewModel: CharacterDetailsViewModel
    
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
                HStack {
                    AsyncImage(url: URL(string: content.image)) { image in
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
                        Text(content.name)
                            .bold()
                            .font(.title3)
                        Text(content.actor)
                            .font(.subheadline)
                            .foregroundColor(.secondary)
                        Text(content.dateOfBirth ?? "N/A")
                            .font(.subheadline)
                            .foregroundColor(.secondary)
                    }
                    // That's an idea of navigating to the Houses View
//                    NavigationLink {
//                        SpellsView(viewModel: .init())
//                    } label: {
//                        EmptyView()
//                    }
                }
                
                HStack(alignment: .center) {
                    VStack(alignment: .center, spacing: 4) {
                        HStack(spacing: 2) {
                            Image("HouseIcon")
                                .resizable()
                                .aspectRatio(contentMode: .fill)
                                .clipShape(Circle())
                                .frame(width: 24, height: 24)
                            Text("House")
                                .bold()
                        }
                        Text(content.house)
                            .font(.subheadline)
                            .foregroundColor(.secondary)
                    }
                    
                    Spacer()
                    
                    VStack(alignment: .center, spacing: 4) {
                        HStack(spacing: 2) {
                            Image("SpaciesIcon")
                                .resizable()
                                .aspectRatio(contentMode: .fill)
                                .clipShape(Circle())
                                .frame(width: 24, height: 24)
                            Text("Species")
                                .bold()
                        }
                        Text(content.species)
                            .font(.subheadline)
                            .foregroundColor(.secondary)
                    }
                }
                
                HStack(alignment: .center) {
                    VStack(alignment: .center, spacing: 4) {
                        HStack(spacing: 2) {
                            Image("WizardIcon")
                                .resizable()
                                .aspectRatio(contentMode: .fill)
                                .clipShape(Circle())
                                .frame(width: 24, height: 24)
                            Text("Wizard")
                                .bold()
                        }
                        Text(content.wizard ? "Yes" : "No")
                            .font(.subheadline)
                            .foregroundColor(.secondary)
                    }
                    
                    Spacer()
                    
                    VStack(alignment: .center, spacing: 4) {
                        HStack(spacing: 2) {
                            Image("BloodIcon")
                                .resizable()
                                .aspectRatio(contentMode: .fill)
                                .clipShape(Circle())
                                .frame(width: 24, height: 24)
                            Text("Ancestry")
                                .bold()
                        }
                        Text(content.ancestry.isEmpty ? "N/A" : content.ancestry)
                            .font(.subheadline)
                            .foregroundColor(.secondary)
                    }
                }
                
                HStack(alignment: .center) {
                    VStack(alignment: .center, spacing: 4) {
                        HStack(spacing: 2) {
                            Image("WandIcon")
                                .resizable()
                                .aspectRatio(contentMode: .fill)
                                .clipShape(Circle())
                                .frame(width: 24, height: 24)
                            Text("Wand Core")
                                .bold()
                        }
                        Text(content.wand.core.isEmpty ? "N/A" : content.wand.core)
                            .font(.subheadline)
                            .foregroundColor(.secondary)
                    }
                    
                    Spacer()
                    
                    VStack(alignment: .center, spacing: 4) {
                        HStack(spacing: 2) {
                            Image("HairIcon")
                                .resizable()
                                .aspectRatio(contentMode: .fill)
                                .clipShape(Circle())
                                .frame(width: 24, height: 24)
                            Text("Hair Color")
                                .bold()
                        }
                        Text(content.hairColour.isEmpty ? "N/A" : content.hairColour)
                            .font(.subheadline)
                            .foregroundColor(.secondary)
                    }
                }
                
                HStack(alignment: .center) {
                    VStack(alignment: .center, spacing: 4) {
                        HStack(spacing: 2) {
                            Image("WandIcon")
                                .resizable()
                                .aspectRatio(contentMode: .fill)
                                .clipShape(Circle())
                                .frame(width: 24, height: 24)
                            Text("Wand Wood")
                                .bold()
                        }
                        Text(content.wand.wood.isEmpty ? "N/A" : content.wand.wood)
                            .font(.subheadline)
                            .foregroundColor(.secondary)
                    }
                    
                    Spacer()
                    
                    VStack(alignment: .center, spacing: 4) {
                        HStack(spacing: 2) {
                            Image("EyeIcon")
                                .resizable()
                                .aspectRatio(contentMode: .fill)
                                .clipShape(Circle())
                                .frame(width: 24, height: 24)
                            Text("Eye Color")
                                .bold()
                        }
                        Text(content.eyeColour.isEmpty ? "N/A" : content.eyeColour)
                            .font(.subheadline)
                            .foregroundColor(.secondary)
                    }
                }
                
                HStack(alignment: .center) {
                    VStack(alignment: .center, spacing: 4) {
                        HStack(spacing: 2) {
                            Image("WandIcon")
                                .resizable()
                                .aspectRatio(contentMode: .fill)
                                .clipShape(Circle())
                                .frame(width: 24, height: 24)
                            Text("Wand Length")
                                .bold()
                        }
                        Text(verbatim: "\(content.wand.length ?? 0)")
                            .font(.subheadline)
                            .foregroundColor(.secondary)
                    }
                    
                    Spacer()
                    
                    VStack(alignment: .center, spacing: 4) {
                        HStack(spacing: 2) {
                            Image("ShieldIcon")
                                .resizable()
                                .aspectRatio(contentMode: .fill)
                                .clipShape(Circle())
                                .frame(width: 24, height: 24)
                            Text("Patronus")
                                .bold()
                        }
                        Text(content.patronus.isEmpty ? "N/A" : content.patronus)
                            .font(.subheadline)
                            .foregroundColor(.secondary)
                    }
                }
            }
            .listStyle(.insetGrouped)
            .navigationTitle("Character Details")
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

private extension CharacterDetailsView {
    enum Defaults {
        static let externalLink = "https://www.google.com"
    }
}
