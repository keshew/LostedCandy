import SwiftUI

class BoomBlustViewModel: ObservableObject {
    let contact = BoomBlustModel()
    
    func createGameScene(gameData: BoomBlustData) -> BoomBlust {
        let scene = BoomBlust()
        scene.game  = gameData
        return scene
    }
}
