import SwiftUI
import SpriteKit

struct BoomBlustView: View {
    @StateObject var boomBlustModel =  BoomBlustViewModel()
    @Environment(\.verticalSizeClass) var verticalSizeClass
    @StateObject private var gameData = BoomBlustData()
    
    var body: some View {
        GeometryReader { geometry in
            if verticalSizeClass == .compact {
                SpriteView(scene: boomBlustModel.createGameScene(gameData: gameData))
                    .ignoresSafeArea()
                    .navigationBarBackButtonHidden(true)
                
                    .navigationDestination(isPresented: $gameData.isWin) {
                        GameLoadingView()
                    }
            }
        }
    }
}

#Preview {
    BoomBlustView()
}

