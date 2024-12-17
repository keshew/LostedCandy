import SwiftUI
import SpriteKit

struct StarCatchingView: View {
    @StateObject var starCatchingModel =  StarCatchingViewModel()
    @Environment(\.verticalSizeClass) var verticalSizeClass
    @StateObject private var gameData = StarCatchingData()
    var body: some View {
        GeometryReader { geometry in
            if verticalSizeClass == .compact {
                SpriteView(scene: starCatchingModel.createGameScene(gameData: gameData))
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
    StarCatchingView()
}

