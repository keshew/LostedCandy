import SwiftUI

class MainGameViewModel: ObservableObject {
    let contact = MainGameModel()
    
    func createGameScene(gameData: MainGameData) -> MainGame {
        let scene = MainGame()
        scene.game  = gameData
        return scene
    }
}
