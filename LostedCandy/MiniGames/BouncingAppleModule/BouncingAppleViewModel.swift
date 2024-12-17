import SwiftUI

class BouncingAppleViewModel: ObservableObject {
    let contact = BouncingAppleModel()
    
    func createGameScene(gameData: BouncingAppleData) -> BouncingApple {
        let scene = BouncingApple()
        scene.game  = gameData
        return scene
    }
}
