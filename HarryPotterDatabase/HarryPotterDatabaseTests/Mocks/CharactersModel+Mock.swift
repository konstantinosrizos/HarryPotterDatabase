@testable import HarryPotterDatabase

extension CharactersModel {
    static let stub = Self(
        id: "9e3f7ce4-b9a7-4244-b709-dae5c1f1d4a8",
        name: "Harry Potter",
        alternateNames: [
            "The Boy Who Lived",
            "The Chosen One"
         ],
        species: "human",
        gender: "male",
        house: "Gryffindor",
        dateOfBirth: "31-07-1980",
        yearOfBirth: 1980,
        wizard: true,
        ancestry: "half-blood",
        eyeColour: "green",
        hairColour: "black",
        wand: .init(wood: "holly", core: "phoenix feather", length: 11),
        patronus: "stag",
        hogwartsStudent: true,
        hogwartsStaff: false,
        actor: "Daniel Radcliffe",
        alternateActors: [],
        alive: true,
        image: ""
    )
}
