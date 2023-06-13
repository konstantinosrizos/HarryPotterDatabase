import Foundation

struct CharactersModel: Codable, Hashable {
    let id: String
    let name: String
    let alternateNames: [String]
    let species: String
    let gender: String
    let house: String
    let dateOfBirth: String?
    let yearOfBirth: Int?
    let wizard: Bool
    let ancestry: String
    let eyeColour: String
    let hairColour: String
    let wand: WandType
    let patronus: String
    let hogwartsStudent: Bool
    let hogwartsStaff: Bool
    let actor: String
    let alternateActors: [String]
    let alive: Bool
    let image: String
    
    struct WandType: Codable, Hashable{
        let wood: String
        let core: String
        let length: Double?
    }
}
