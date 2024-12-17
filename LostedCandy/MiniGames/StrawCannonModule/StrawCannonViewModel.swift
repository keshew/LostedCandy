import SwiftUI

class StrawCannonViewModel: ObservableObject {
    let contact = StrawCannonModel()
    
    func createGameScene(gameData: StrawCannonData) -> StrawCannon {
        let scene = StrawCannon()
        scene.game  = gameData
        return scene
    }
}
