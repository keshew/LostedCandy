import SwiftUI

class StarCatchingViewModel: ObservableObject {
    let contact = StarCatchingModel()
    
    func createGameScene(gameData: StarCatchingData) -> StarCatching {
        let scene = StarCatching()
        scene.game  = gameData
        return scene
    }
}
